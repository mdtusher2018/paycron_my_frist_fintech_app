import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:template/src/presentation/router/routes.dart';
import 'package:template/src/core/di/dependency_injection.dart';
import 'package:template/src/core/services/storage/storage_key.dart';
import 'package:template/src/domain/entites/home_entity.dart';
import 'package:template/src/presentation/features/home/home_view_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late String token;
  @override
  void initState() {
    super.initState();
    ref.read(localStorageProvider).readKey(StorageKey.accessToken);
    Future.microtask(
      () => ref.read(homeNotifierProvider.notifier).loadHomeData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: homeState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) {
          if (data == null) return const SizedBox();

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(homeNotifierProvider.notifier).loadHomeData();
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                _buildHeader(data.balance),
                _buildActionButtons(),
                _buildTransactionList(data.transactions),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(double balance) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4A6CF7), Color(0xFF3B5BDB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text(
              "BDT ${balance.toStringAsFixed(2)}",
              key: ValueKey(balance),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          const _AddMoneyButton(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                context.push(AppRoutes.sendMoney);
              },
              child: _ActionItem(icon: Icons.send, label: "Send"),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(ref.context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Navbar and others featured Comming soon....",
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: _ActionItem(icon: Icons.request_page, label: "Request"),
            ),
            InkWell(
              onTap: () {
                context.go(AppRoutes.signIn);
              },
              child: _ActionItem(icon: Icons.logout, label: "Logout"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionEntity> transactions) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transaction History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...transactions.map(
            (tx) => _TransactionItem(
              isCredit: tx.amount >= 0,
              title: "${tx.senderName} → ${tx.reciverName}",
              amount: tx.amount.abs().toStringAsFixed(2),
              time: DateFormat(
                'dd MMM yyyy, hh:mm a',
              ).format(DateTime.parse(tx.transactionsTime)),
              status: tx.status,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ------------------- Reusable Widgets -------------------

class _AddMoneyButton extends StatelessWidget {
  const _AddMoneyButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        context.push(AppRoutes.addMoney);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text("Add Money"),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final bool isCredit;
  final String title;
  final String amount;
  final String time;
  final String status;

  const _TransactionItem({
    required this.isCredit,
    required this.title,
    required this.amount,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final Color amountColor = isCredit ? Colors.green : Colors.red;
    final IconData icon = isCredit ? Icons.arrow_downward : Icons.arrow_upward;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: amountColor.withOpacity(0.1),
            child: Icon(icon, color: amountColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "${status != "Pending"
                    ? isCredit
                          ? '+'
                          : '-'
                    : ""}\$$amount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: amountColor,
                ),
              ),
              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}
