part of "../dependency_injection.dart";

@riverpod
IAuthRepository authRepository(Ref ref) {
  final api = ref.watch(apiServiceProvider);
  final localStorageService = ref.watch(localStorageProvider);
  return AuthRepository(api, localStorageService);
}

@riverpod
IProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(apiServiceProvider));
}

@riverpod
IHomeRepository homeRepository(Ref ref) {
  return HomeRepository(ref.watch(apiServiceProvider),ref.watch(localStorageProvider));
}
@riverpod
ICardRepository cardRepository(Ref ref) {
  return CardRepository(ref.watch(apiServiceProvider));
}

@riverpod
IRequestRepository requestRepository(Ref ref) {
  return RequestRepository(ref.watch(apiServiceProvider));
}
