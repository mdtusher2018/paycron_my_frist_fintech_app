import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';

part 'payment_notifier.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> payWithSavedCard({
    required double amount,
    required String paymentMethodId,
  }) async {
    state = const AsyncLoading();

    final homeUsecase = ref.read(homeUsecaseProvider);

    final result = await homeUsecase.payWithSavedCard(
      amount: amount,
      paymentMethodId: paymentMethodId,
    );

    if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      state = AsyncError(error.message, StackTrace.current);
      return;
    }

    state = const AsyncData(null);
  }
}
