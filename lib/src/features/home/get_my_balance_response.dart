import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_my_balance_response.freezed.dart';
part 'get_my_balance_response.g.dart';

@freezed
abstract class GetMyBalance with _$GetMyBalance {
  const factory GetMyBalance({
    required int statusCode,
    required bool status,
    required double balance,
    required String currency,
  }) = _GetMyBalance;

  factory GetMyBalance.fromJson(Map<String, dynamic> json) =>
      _$GetMyBalanceFromJson(json);
}
