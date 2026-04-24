import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/card/card_model.dart';
import 'package:paycron_app/src/domain/repositories/i_card_repository.dart';

class CardUsecase {
  final ICardRepository repository;
  CardUsecase({required this.repository});

  Future<Result<String, Failure>> createSetupIntent() =>
      repository.createSetupIntent();

  Future<Result<bool, Failure>> savePaymentMethod(String paymentMethodId) =>
      repository.savePaymentMethod(paymentMethodId);

  Future<Result<CardListResponse, Failure>> getSavedCards() =>
      repository.getSavedCards();

  Future<Result<bool, Failure>> setDefaultCard(String paymentMethodId) =>
      repository.setDefaultCard(paymentMethodId);

  Future<Result<bool, Failure>> deleteCard(String paymentMethodId) =>
      repository.deleteCard(paymentMethodId);
}
