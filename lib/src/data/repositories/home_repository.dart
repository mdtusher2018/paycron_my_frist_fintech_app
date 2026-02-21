import 'dart:convert';

import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/core/services/network/i_api_service.dart';
import 'package:template/src/core/services/storage/i_local_storage_service.dart';
import 'package:template/src/core/services/storage/storage_key.dart';
import 'package:template/src/core/utils/api_end_points.dart';
import 'package:template/src/data/models/create_transaction/create_transaction_response.dart';
import 'package:template/src/data/models/get_balance/get_my_balance_response.dart';
import 'package:template/src/data/models/get_transaction/get_my_transaction_response.dart';

import 'package:template/src/domain/repositories/i_home_repositoty.dart';

final class HomeRepository extends IHomeRepository {
  final IApiService _apiService;
  final ILocalStorageService _localStorageService;
  HomeRepository(this._apiService, this._localStorageService);

  @override
  Future<Result<String, Failure>> deposite({
    String curency = "BDT",
    required num amount,
  }) {
    return asyncGuard(() async {
      final result = await _apiService.post(ApiEndpoints.createADeposite, {
        "amount": amount,
        "currency": curency,
      }) as Map<String,dynamic>;

      final clientSecret= result['clientSecret']as String;
      return clientSecret;
    });
  }

  @override
  Future<Result<CreateTransactionResponse, Failure>> sendMoney({
    required String email,
    required num amount,
  }) {
    return asyncGuard(() async {
      final result = await _apiService.patch(ApiEndpoints.transferMoney, {
        "receiverEmail": email,
        "amount": amount,
      });
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
  Future<Result<String, Failure>> getMyUserId() {
    return asyncGuard(() async {
      final accessToken =
          await _localStorageService.readKey(StorageKey.accessToken) as String?;
      final parts = accessToken!.split('.');

      final payloadBase64 = parts[1];

      String normalized = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64Url.decode(normalized));

      final payloadMap = json.decode(payloadString) as Map<String, dynamic>;

      return payloadMap['id'] as String;
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
