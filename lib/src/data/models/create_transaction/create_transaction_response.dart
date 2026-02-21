import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_response.freezed.dart';
part 'create_transaction_response.g.dart';

@freezed
abstract class CreateTransactionResponse with _$CreateTransactionResponse {
  const factory CreateTransactionResponse({
    required int statusCode,
    required bool status,
  }) = _CreateTransactionResponse;

  factory CreateTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionResponseFromJson(json);
}
