import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/card/card_model.dart';

abstract base class ICardRepository extends Repository {
  Future<Result<String, Failure>> createSetupIntent();
  Future<Result<bool, Failure>> savePaymentMethod(String paymentMethodId);
  Future<Result<CardListResponse, Failure>> getSavedCards();
  Future<Result<bool, Failure>> setDefaultCard(String paymentMethodId);
  Future<Result<bool, Failure>> deleteCard(String paymentMethodId);
}
