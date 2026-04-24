import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/services/network/i_api_service.dart';
import 'package:paycron_app/src/core/utils/api_end_points.dart';
import 'package:paycron_app/src/data/models/money_request/money_request_model.dart';
import 'package:paycron_app/src/domain/repositories/i_request_repository.dart';

final class RequestRepository extends IRequestRepository {
  final IApiService _apiService;
  RequestRepository(this._apiService);

  @override
  Future<Result<MoneyRequestListResponse, Failure>> getSentRequests() {
    return asyncGuard(() async {
      final result =
          await _apiService.get(ApiEndpoints.requestsSent) as Map<String, dynamic>;
      return MoneyRequestListResponse.fromJson(result);
    });
  }

  @override
  Future<Result<MoneyRequestListResponse, Failure>> getReceivedRequests() {
    return asyncGuard(() async {
      final result =
          await _apiService.get(ApiEndpoints.requestsReceived) as Map<String, dynamic>;
      return MoneyRequestListResponse.fromJson(result);
    });
  }

  @override
  Future<Result<bool, Failure>> approveRequest({
    required String requestId,
    required String pin,
  }) {
    return asyncGuard(() async {
      await _apiService.post(ApiEndpoints.requestsApprove, {
        'requestId': requestId,
        'pin': pin,
      });
      return true;
    });
  }

  @override
  Future<Result<bool, Failure>> rejectRequest({required String requestId}) {
    return asyncGuard(() async {
      await _apiService.post(ApiEndpoints.requestsReject, {
        'requestId': requestId,
      });
      return true;
    });
  }
}
