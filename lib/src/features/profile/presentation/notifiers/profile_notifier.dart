import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/src/core/base/failure.dart';
import 'package:template/src/core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import 'package:template/src/features/profile/domain/entities/user_profile_entity.dart';
import 'package:template/src/features/profile/domain/usecase/profile_usecase.dart';

part 'profile_notifier.g.dart';
part 'profile_notifier.freezed.dart';

@riverpod
ProfileUsecase profileUsecase(Ref ref) {
  return ProfileUsecase(repository: ref.watch(profileRepositoryProvider));
}

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.data(UserProfileEntity profile) = ProfileData;
  const factory ProfileState.error(
    Object error,
    StackTrace trace, {
    UserProfileEntity? profile,
  }) = ProfileError;
  const factory ProfileState.refetching(UserProfileEntity profile) =
      ProfileRefetching;
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  late final ProfileUsecase usecase;

  @override
  ProfileState build() {
    usecase = ref.watch(profileUsecaseProvider);
    fetchProfile();
    return ProfileState.loading();
  }

  Future<void> fetchProfile() async {
    state = const ProfileState.loading();
    final result = await usecase.profileUseCase();

    if (result is Success) {
      final data = (result as Success).data as UserProfileEntity;
      state = ProfileState.data(data);
    } else if (result is FailureResult) {
      final Failure error = (result as FailureResult).error;
      state = ProfileState.error(
        error.message,
        error.stackTrace ?? StackTrace.fromString("No trace found"),
      );
    }
  }

  Future<void> refetch() async {
    final current = state;
    UserProfileEntity? temp;

    if (current is ProfileData) {
      temp = current.profile;
      state = ProfileState.refetching(current.profile);
    } else if (current is ProfileError && current.profile != null) {
      temp = current.profile;
    }

    final result = await usecase.profileUseCase();

    if (result is Success) {
      final data = (result as Success).data as UserProfileEntity;
      state = ProfileState.data(data);
    } else if (result is FailureResult) {
      final Failure error = (result as FailureResult).error;
      state = ProfileState.error(
        error.message,
        error.stackTrace ?? StackTrace.fromString("No trace found"),
        profile: temp,
      );
    }
  }
}
