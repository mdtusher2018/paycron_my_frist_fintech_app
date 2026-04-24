import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/money_request/money_request_model.dart';
import 'package:paycron_app/src/domain/repositories/i_request_repository.dart';

class RequestUsecase {
  final IRequestRepository repository;
  RequestUsecase({required this.repository});

  Future<Result<MoneyRequestListResponse, Failure>> getSentRequests() =>
      repository.getSentRequests();

  Future<Result<MoneyRequestListResponse, Failure>> getReceivedRequests() =>
      repository.getReceivedRequests();

  Future<Result<bool, Failure>> approveRequest({
    required String requestId,
    required String pin,
  }) =>
      repository.approveRequest(requestId: requestId, pin: pin);

  Future<Result<bool, Failure>> rejectRequest({required String requestId}) =>
      repository.rejectRequest(requestId: requestId);
}
