import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/domain/usecase/complete_profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
part 'complete_profile_notifier.g.dart';

@riverpod
class CompleteProfileNotifier extends _$CompleteProfileNotifier {
  late final CompleteProfileUsecase completeProfileUsecase;

  @override
  FutureOr<CompleteProfileEntity?> build() {
    completeProfileUsecase = ref.watch(completeProfileUsecaseProvider);
    return null;
  }

  Future<void> completeProfile(Map<String, dynamic> profileData) async {
    // Set loading state
    state = const AsyncLoading();

    try {
      final result = await completeProfileUsecase.execute(profileData: profileData);

      if (result is Success<CompleteProfileEntity, Failure>) {
        state = AsyncData(result.data) ;
      } else if (result is FailureResult<CompleteProfileEntity, Failure>) {
        final error = result.error;
        state = AsyncError(
          error.message,
          error.stackTrace ?? StackTrace.fromString("No trace Found"),
        );
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}