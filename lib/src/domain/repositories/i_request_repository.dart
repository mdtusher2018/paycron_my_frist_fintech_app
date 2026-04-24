import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/repository.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/data/models/money_request/money_request_model.dart';

abstract base class IRequestRepository extends Repository {
  Future<Result<MoneyRequestListResponse, Failure>> getSentRequests();
  Future<Result<MoneyRequestListResponse, Failure>> getReceivedRequests();
  Future<Result<bool, Failure>> approveRequest({
    required String requestId,
    required String pin,
  });
  Future<Result<bool, Failure>> rejectRequest({required String requestId});
}
