import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/services/network/i_api_service.dart';
import 'package:template/src/core/utils/api_end_points.dart';
import 'package:template/src/data/models/create_transaction/create_transaction_response.dart';
import 'package:template/src/data/models/get_balance/get_my_balance_response.dart';
import 'package:template/src/data/models/get_transaction/get_my_transaction_response.dart';

import 'package:template/src/domain/repositories/i_home_repositoty.dart';

final class HomeRepository extends IHomeRepository {
  final IApiService _apiService;
  HomeRepository(this._apiService);

  @override
  Future<Result<CreateTransactionResponse, Failure>> createATransactions() {
    return asyncGuard(() async {
      final result = await _apiService.get(ApiEndpoints.transferMoney);
      return CreateTransactionResponse.fromJson(result);
    });
  }

  @override
  Future<Result<GetMyBalance, Failure>> getBalance() {
    return asyncGuard(() async {
      final result = await _apiService.get(ApiEndpoints.getMyBalance);
      return GetMyBalance.fromJson(result);
    });
  }

  @override
  Future<Result<TransactionResponse, Failure>> getMyTransactions() {
    return asyncGuard(() async {
      final result = await _apiService.get(ApiEndpoints.getMyTransaction);
      return TransactionResponse.fromJson(result);
    });
  }
}
