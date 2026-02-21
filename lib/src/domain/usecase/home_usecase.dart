import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/data/models/create_transaction/create_transaction_response.dart';
import 'package:template/src/data/models/get_balance/get_my_balance_response.dart';
import 'package:template/src/data/models/get_transaction/get_my_transaction_response.dart';
import 'package:template/src/domain/entites/home_entity.dart';
import 'package:template/src/domain/repositories/i_home_repositoty.dart';

class HomeUsecase {
  final IHomeRepository repository;
  HomeUsecase({required this.repository});
  Future<Result<GetBalanceEntity, Failure>> balanceUsecase() async {
    final result = await repository.getBalance();

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }

    final balanceModel = (result as Success).data as GetMyBalance;
    final GetBalanceEntity entity = GetBalanceEntity(
     balance: balanceModel.balance
    );
    return Success(entity);
  }
  Future<Result<List<TransactionEntity>, Failure>> transactionUsecase() async {
    final result = await repository.getMyTransactions();
final resultOfUserId=await repository.getMyUserId();
    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }
    if (resultOfUserId is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }
    
final myUserId=(resultOfUserId as Success).data as String;
    final transactionModel = (result as Success).data as TransactionResponse;
   final transactionList = transactionModel.transactions
  
    .map((e) => TransactionEntity(
          senderName: e.sender.email,
          reciverName: e.receiver.email,
          amount:(myUserId==e.sender.id && myUserId!=e.receiver.id)?(0- e.amount):e.amount,
          status: e.status,
          transactionsTime: e.timestamp.toString(),
        ))
    .toList();
    return Success(transactionList);
  }



  Future<Result<String, Failure>> sendMoney({required num amount, required String reciverEmail}) async {
    final result = await repository.sendMoney(amount: amount,email: reciverEmail);

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }

    final balanceModel = (result as Success).data as CreateTransactionResponse;
 
    return Success(balanceModel.message);
  }


  Future<Result<String, Failure>> deposite({required num amount}) async {
    final result = await repository.deposite(amount: amount );

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      return FailureResult(error);
    }

    final paymentScreate = (result as Success).data as String;
 
    return Success(paymentScreate);
  }


}
