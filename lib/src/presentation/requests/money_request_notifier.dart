import 'package:paycron_app/src/data/models/money_request/money_request_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/domain/usecase/request_usecase.dart';

part 'money_request_notifier.g.dart';

class MoneyRequestState {
  final List<MoneyRequestModel> received;
  final List<MoneyRequestModel> sent;

  MoneyRequestState({required this.received, required this.sent});
}

@riverpod
class MoneyRequestNotifier extends _$MoneyRequestNotifier {
  late final RequestUsecase requestUsecase;

  @override
  FutureOr<MoneyRequestState?> build() {
    requestUsecase = ref.watch(requestUsecaseProvider);
    return null; // same as your HomeNotifier
  }

  Future<void> loadRequests() async {
    state = const AsyncLoading();

    // Call both APIs
    final receivedResult = await requestUsecase.getReceivedRequests();
    final sentResult = await requestUsecase.getSentRequests();

    // Handle received error
    if (receivedResult is FailureResult) {
      final error = (receivedResult as FailureResult).error as Failure;
      state = AsyncError(error.message, error.stackTrace ?? StackTrace.current);
      return;
    }

    // Handle sent error
    if (sentResult is FailureResult) {
      final error = (sentResult as FailureResult).error as Failure;
      state = AsyncError(error.message, error.stackTrace ?? StackTrace.current);
      return;
    }

    final received =
        ((receivedResult as Success).data as MoneyRequestListResponse).requests;
    final sent =
        ((sentResult as Success).data as MoneyRequestListResponse).requests;

    state = AsyncData(MoneyRequestState(received: received, sent: sent));
  }

  // 🔄 Refresh helper
  Future<void> refreshRequests() async {
    await loadRequests();
  }

  // ✅ APPROVE REQUEST
  Future<void> approveRequest({
    required String requestId,
    required String pin,
  }) async {
    final result = await requestUsecase.approveRequest(
      requestId: requestId,
      pin: pin,
    );

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      state = AsyncError(error.message, StackTrace.current);
      return;
    }
  }

  // ❌ REJECT REQUEST
  Future<void> rejectRequest({required String requestId}) async {
    final result = await requestUsecase.rejectRequest(requestId: requestId);

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      state = AsyncError(error.message, StackTrace.current);
      return;
    }
  }
}
