import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/base/failure.dart';

import 'package:template/src/presentation/features/home/home_view_notifier.dart';
import 'package:template/src/core/di/dependency_injection.dart';

class SendMoneyPage extends ConsumerWidget {
  const SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final amountController = TextEditingController();
    final homeUsecase = ref.read(homeUsecaseProvider);

    Future<void> sendMoney() async {
      final email = emailController.text.trim();
      final amountText = amountController.text.trim();

      // Inline validation
      if (email.isEmpty || !email.contains("@")) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid email")),
        );
        return;
      }
      if (amountText.isEmpty || double.tryParse(amountText) == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid amount")),
        );
        return;
      }

      final amount = double.parse(amountText);

      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      final result = await homeUsecase.sendMoney(
        amount: amount,
        reciverEmail: email,
      );

      Navigator.of(context).pop(); // Close loading

      if (result is Success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Money sent successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        emailController.clear();
        amountController.clear();
        ref.read(homeNotifierProvider.notifier).loadHomeData();
      } else if (result is FailureResult) {
        final error = (result as FailureResult).error as Failure;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message), backgroundColor: Colors.red),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Transaction failed!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Send Money"),
        backgroundColor: const Color(0xFF4A6CF7),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Email Field
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Recipient Email",
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Amount Field
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                prefixIcon: const Icon(Icons.attach_money),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Send Button
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A6CF7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: sendMoney,
                child: const Text("Send", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
