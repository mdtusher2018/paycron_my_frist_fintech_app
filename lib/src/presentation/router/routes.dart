class AppRoutes {
  // Onboarding
  static const String onboardingScreen = '/onboarding';

  // Registration Intro
  static const String createAccountIntroScreen = '/create-account-intro';
  static const String createAccountScreen = 'create-account';
  static const String confirmPhoneScreen = 'confirm-phone';

  // Account Setup Flow
  static const String addPersonalInfoScreen = '/addPersonalInfo';
  static const String homeAddressScreen = '/homeAddress';
  static const String countryResidenceScreen = '/countryResidence';

  // ================= ACCOUNT VERIFICATION =================
  static const String accountSetupProgressScreen = '/accountSetupProgress';
  static const String takeSelfieInstructionScreen = '/takeSelfieInstruction';
  static const String selfieCameraScreen = '/selfieCamera';
  static const String idVerificationProgressScreen = '/idVerificationProgress';
  static const String scanIdScreen = '/scanId';

  // Send Money
  static const String sendChooseRecipient = '/send-choose-recipient';
  static const String sendScanQr = '/send-scan-qr';
  static const String sendSelectPurpose = '/send-select-purpose';
  static const String sendEnterAmount = '/send-enter-amount';
  static const String sendEnterPin = '/send-enter-pin';
  static const String sendComplete = '/send-complete';

  // Receive Money
  static const String receiveChooseRecipient = '/receive-choose-recipient';
  static const String receiveScanQr = '/receive-scan-qr';
  static const String receiveSelectPurpose = '/receive-select-purpose';
  static const String receiveEnterAmount = '/receive-enter-amount';
  static const String receiveEnterPin = '/receive-enter-pin';
  static const String receiveComplete = '/receive-complete';

  static const String splash = '/';
  static const String signIn = '/signin';

  static const String home = '/home';
  static const String sendMoney = '/send-money';
  static const String addMoney = '/add-money';

  // NEW: Cards & Requests
  static const String cardsManagement = '/cards-management';
  static const String moneyRequests = '/money-requests';
}
