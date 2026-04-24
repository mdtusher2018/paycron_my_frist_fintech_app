part of "../dependency_injection.dart";

@riverpod
SigninUseCase loginUseCase(Ref ref) {
  return SigninUseCase(
    authRepository: ref.watch(authRepositoryProvider),
    localStorage: ref.watch(localStorageProvider),
  );
}

@riverpod
SignupUseCase signupUseCase(Ref ref) {
  return SignupUseCase(
    localStorage: ref.watch(localStorageProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}

@riverpod
EmailVerifiedUsecase emailVerifiedUsecase(Ref ref) {
  return EmailVerifiedUsecase(
    authRepository: ref.watch(authRepositoryProvider),
    localStorage: ref.watch(localStorageProvider),
  );
}

@riverpod
HomeUsecase homeUsecase(Ref ref) {
  return HomeUsecase(repository: ref.read(homeRepositoryProvider));
}

@riverpod
GetProfileUsecase profileUsecase(Ref ref) {
  return GetProfileUsecase(repository: ref.watch(profileRepositoryProvider));
}

@riverpod
CompleteProfileUsecase completeProfileUsecase(Ref ref) {
  return CompleteProfileUsecase(repo: ref.watch(profileRepositoryProvider));
}

@riverpod
CardUsecase cardUsecase(Ref ref) {
  return CardUsecase(repository: ref.watch(cardRepositoryProvider));
}

@riverpod
RequestUsecase requestUsecase(Ref ref) {
  return RequestUsecase(repository: ref.watch(requestRepositoryProvider));
}
