import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import 'package:template/src/domain/usecase/home_usecase.dart';
import 'package:template/src/domain/entites/home_entity.dart';
import 'package:template/src/core/di/dependency_injection.dart';

part 'home_view_notifier.g.dart';

class HomeState {
  final double balance;
  final List<TransactionEntity> transactions;

  HomeState({
    required this.balance,
    required this.transactions,
  });
}
@riverpod
class HomeNotifier extends _$HomeNotifier {
  late final HomeUsecase homeUsecase;

  @override
  FutureOr<HomeState?> build() {
    homeUsecase = ref.watch(homeUsecaseProvider);
    return null;
  }

  Future<void> loadHomeData() async {
    state = const AsyncLoading();

    // Call both APIs
    final balanceResult = await homeUsecase.balanceUsecase();
    final transactionResult = await homeUsecase.transactionUsecase();

    // Check balance error
    if (balanceResult is FailureResult) {
      final error = (balanceResult as FailureResult).error as Failure;
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.current,
      );
      return;
    }

    // Check transaction error
    if (transactionResult is FailureResult) {
      final error = (transactionResult as FailureResult).error as Failure;
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.current,
      );
      return;
    }

    final balance = (balanceResult as Success).data.balance;
    final transactions = (transactionResult as Success).data;

    state = AsyncData(
      HomeState(
        balance: balance,
        transactions: transactions,
      ),
    );
  }



}