import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/services/network/i_api_service.dart';
import 'package:paycron_app/src/core/utils/api_end_points.dart';
import 'package:paycron_app/src/data/models/card/card_model.dart';
import 'package:paycron_app/src/domain/repositories/i_card_repository.dart';

final class CardRepository extends ICardRepository {
  final IApiService _apiService;
  CardRepository(this._apiService);

  @override
  Future<Result<String, Failure>> createSetupIntent() {
    return asyncGuard(() async {
      final result =
          await _apiService.post(ApiEndpoints.setupIntent, {})
              as Map<String, dynamic>;
      return result['clientSecret'] as String;
    });
  }

  @override
  Future<Result<bool, Failure>> savePaymentMethod(String paymentMethodId) {
    return asyncGuard(() async {
      await _apiService.post(
          ApiEndpoints.savePaymentMethod, {'paymentMethodId': paymentMethodId});
      return true;
    });
  }

  @override
  Future<Result<CardListResponse, Failure>> getSavedCards() {
    return asyncGuard(() async {
      final result =
          await _apiService.get(ApiEndpoints.listCards) as Map<String, dynamic>;
      return CardListResponse.fromJson(result);
    });
  }

  @override
  Future<Result<bool, Failure>> setDefaultCard(String paymentMethodId) {
    return asyncGuard(() async {
      await _apiService.post(
          ApiEndpoints.setDefaultCard, {'paymentMethodId': paymentMethodId});
      return true;
    });
  }

  @override
  Future<Result<bool, Failure>> deleteCard(String paymentMethodId) {
    return asyncGuard(() async {
      await _apiService.delete(
        ApiEndpoints.deleteCard,
        body: {'paymentMethodId': paymentMethodId},
      );
      return true;
    });
  }
}
