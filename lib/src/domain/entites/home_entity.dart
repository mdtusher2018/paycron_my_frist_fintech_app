
class GetBalanceEntity {
  final num balance;

  GetBalanceEntity({required this.balance});
}

class TransactionEntity {
  final String senderName;
  final String reciverName;
  final num amount;
  final String status;
  final String transactionsTime;

  TransactionEntity({
    required this.senderName,
    required this.reciverName,
    required this.amount,
    required this.status,
    required this.transactionsTime,
  });
}



