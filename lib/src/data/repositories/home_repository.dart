import 'dart:convert';

import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/services/network/i_api_service.dart';
import 'package:paycron_app/src/core/services/storage/i_local_storage_service.dart';
import 'package:paycron_app/src/core/services/storage/storage_key.dart';
import 'package:paycron_app/src/core/utils/api_end_points.dart';
import 'package:paycron_app/src/core/utils/logger.dart';
import 'package:paycron_app/src/data/models/create_transaction/create_transaction_response.dart';
import 'package:paycron_app/src/data/models/get_balance/get_my_balance_response.dart';
import 'package:paycron_app/src/data/models/get_transaction/get_my_transaction_response.dart';

import 'package:paycron_app/src/domain/repositories/i_home_repositoty.dart';

final class HomeRepository extends IHomeRepository {
  final IApiService _apiService;
  final ILocalStorageService _localStorageService;
  HomeRepository(this._apiService, this._localStorageService);

  @override
  Future<Result<(String, String), Failure>> deposite({
    String curency = "BDT",
    required num amount,
  }) {
    return asyncGuard(() async {
      final result =
          await _apiService.post(ApiEndpoints.createADeposite, {
                "amount": amount,
                "currency": curency,
              })
              as Map<String, dynamic>;

      final clientSecret = result['clientSecret'] as String;
      final paymentIntentId = result['paymentIntentId'] as String;
      return (clientSecret, paymentIntentId);
    });
  }

  @override
  Future<Result<bool, Failure>> checkEmailExists({required String email}) {
    return asyncGuard(() async {
      final result =
          await _apiService.post(ApiEndpoints.checkEmailExists, {
                "email": email,
              })
              as Map<String, dynamic>;

      final status = result['status'] as bool;
      return status;
    });
  }

  @override
  Future<Result<String, Failure>> depositeSucess({
    required String paymentIntent,
  }) {
    return asyncGuard(() async {
      final result =
          await _apiService.post(ApiEndpoints.depositeSucess, {
                "payment_intent": paymentIntent,
              })
              as Map<String, dynamic>;

      final message = result['message'] as String;
      return message;
    });
  }

  @override
  Future<Result<CreateTransactionResponse, Failure>> sendMoney({
    required String email,
    required num amount,
    required String purpose,
    required String pin,
  }) {
    return asyncGuard(() async {
      final result = await _apiService.patch(ApiEndpoints.transferMoney, {
        "receiverEmail": email,
        "amount": amount,
        "purpose": purpose,
        "pin": pin,
      });
      return CreateTransactionResponse.fromJson(result);
    });
  }

  @override
  Future<Result<CreateTransactionResponse, Failure>> reciveMoneyRequest({
    required String email,
    required num amount,
    required String purpose,
    required String pin,
  }) {
    return asyncGuard(() async {
      final result = await _apiService.post(ApiEndpoints.requestMoney, {
        "senderEmail": email,
        "amount": amount,
        "purpose": purpose,
        "pin": pin,
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

  @override
  Future<Result<String, Failure>> payWithSavedCard({
    required num amount,
    required String paymentMethodId,
  }) {
    return asyncGuard(() async {
      final result = await _apiService.post(ApiEndpoints.payWithSavedCard, {
        "amount": amount,
        "payment_method": paymentMethodId,
      });

      AppLogger.log(result.toString());
      final message = result['message'] as String;
      return message;
    });
  }
}
