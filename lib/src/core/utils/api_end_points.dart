class ApiEndpoints {
  static String mapKey = "AIzaSyBuSZJklSc1j0D4kqhkJcmyArcZbWujbXQ";

  // static String mapResturant(String resturantName)=>"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$resturantName&types=establishment&key=$mapKey";
  static String mapResturant(String resturantName) =>
      "https://places.googleapis.com/v1/places:searchText?query=$resturantName&key=$mapKey";

  static const String baseUrl = 'http://127.0.0.1:3000/';
  static const String baseImageUrl = 'http://127.0.0.1:3000';

  // static const String baseUrl = 'http://103.186.20.117:6136/api/v1/';
  // static const String baseImageUrl = 'http://103.186.20.117:6136';

  static String refreshToken = "auth/refresh-token";

  //authentication
  static String signin = "auth/signin";

  static String signup = "auth/signup";

  static String emailVerification = "auth/email-verification";
  static String getMyTransaction = "transactions/transactions";
  static String transferMoney = "transactions/transfer";
  static String createADeposite = "transactions/create-deposit";
  static String getMyBalance = "balance/my-balance";

  static String userProfile = "users/user-details";
}
