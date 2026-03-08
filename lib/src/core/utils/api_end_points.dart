class ApiEndpoints {
  static String mapKey = "AIzaSyBuSZJklSc1j0D4kqhkJcmyArcZbWujbXQ";

  // static String mapResturant(String resturantName)=>"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$resturantName&types=establishment&key=$mapKey";
  static String mapResturant(String resturantName) =>
      "https://places.googleapis.com/v1/places:searchText?query=$resturantName&key=$mapKey";

  // static const String baseUrl = 'https://paycron-my-frist-fintech-1.onrender.com/';
  // static const String baseImageUrl = 'https://paycron-my-frist-fintech-1.onrender.com';

  static const String baseUrl = 'http://192.168.1.101:3000/';
  static const String baseImageUrl = 'http://192.168.1.101:3000';

  // static const String baseUrl = 'http://10.10.10.21:3000/';

  static String refreshToken = "auth/refresh-token";

  //authentication
  static String signin = "auth/signin";
  static String signup = "auth/signup";
  static String emailVerification = "auth/email-verification";


  static String getMyTransaction = "transactions/my-transactions";
  static String transferMoney = "transactions/transfer";
  static String createADeposite = "transactions/create-deposit";
  static String depositeSucess = "transactions/deposit-sucess";

  static String getMyBalance = "balance/my-balance";

  static String checkEmailExists= "user/check-email-exists";
  static String userProfile = "user/user-details";
  static String completeProfile = "user/complete-profile";
}
