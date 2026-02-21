import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/di/dependency_injection.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class AddMoneyPage extends ConsumerWidget {
  AddMoneyPage({super.key});
  final amountController = TextEditingController();

  Future<void> addMoney({required WidgetRef ref}) async {
    final amountText = amountController.text.trim();
    final homeUsecase = ref.read(homeUsecaseProvider);

    // Inline validation
    if (amountText.isEmpty || double.tryParse(amountText) == null) {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid amount")),
      );
      return;
    }

    final amount = double.parse(amountText);

    // Show loading
    showDialog(
      context: ref.context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final result = await homeUsecase.deposite(amount: amount);

    Navigator.of(ref.context).pop(); // Close loading

    if (result is Success) {
      // paymentSecret could be used to open Stripe
      final clientSecret = (result as Success).data as String;

      try {
        // Initialize Stripe Payment Sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "Your App Name",
          ),
        );

        // Present the payment sheet
        await Stripe.instance.presentPaymentSheet();

        ScaffoldMessenger.of(
          ref.context,
        ).showSnackBar(const SnackBar(content: Text("Payment successful!")));
      } catch (e) {
        ScaffoldMessenger.of(
          ref.context,
        ).showSnackBar(SnackBar(content: Text("Payment failed: $e")));
      }

      amountController.clear();
    } else if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(content: Text(error.message), backgroundColor: Colors.red),
      );
    } else {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Add Money"),
        backgroundColor: const Color(0xFF4A6CF7),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Amount Field
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Amount",
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

            // Add Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A6CF7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  addMoney(ref: ref);
                },
                child: const Text("Add Money", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
