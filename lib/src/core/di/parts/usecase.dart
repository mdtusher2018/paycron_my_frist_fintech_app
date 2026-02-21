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
