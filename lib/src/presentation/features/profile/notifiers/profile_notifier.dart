import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/domain/usecase/get_profile_usecase.dart';

part 'profile_notifier.g.dart';
part 'profile_notifier.freezed.dart';


@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.data(GetMyProfileEntity profile) = ProfileData;
  const factory ProfileState.error(
    Object error,
    StackTrace trace, {
    GetMyProfileEntity? profile,
  }) = ProfileError;
  const factory ProfileState.refetching(GetMyProfileEntity profile) =
      ProfileRefetching;
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  late final GetProfileUsecase usecase;

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
      final data = (result as Success).data as GetMyProfileEntity;
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
    GetMyProfileEntity? temp;

    if (current is ProfileData) {
      temp = current.profile;
      state = ProfileState.refetching(current.profile);
    } else if (current is ProfileError && current.profile != null) {
      temp = current.profile;
    }

    final result = await usecase.profileUseCase();

    if (result is Success) {
      final data = (result as Success).data as GetMyProfileEntity;
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
