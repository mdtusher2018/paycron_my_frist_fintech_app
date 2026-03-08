import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/create_transaction/create_transaction_response.dart';
import 'package:paycron_app/src/data/models/get_balance/get_my_balance_response.dart';
import 'package:paycron_app/src/data/models/get_transaction/get_my_transaction_response.dart';

abstract base class IHomeRepository extends Repository {
  Future<Result<GetMyBalance, Failure>> getBalance();
  Future<Result<TransactionResponse, Failure>> getMyTransactions();
  Future<Result<bool, Failure>> checkEmailExists({required String email});
  Future<Result<CreateTransactionResponse, Failure>> sendMoney({
    required String email,
    required num amount,
    required String purpose,
    required String pin,
  });
  Future<Result<String, Failure>> getMyUserId();

  Future<Result<(String, String), Failure>> deposite({
    String curency,
    required num amount,
  });
  Future<Result<String, Failure>> depositeSucess({
    required String paymentIntent,
  });
}
