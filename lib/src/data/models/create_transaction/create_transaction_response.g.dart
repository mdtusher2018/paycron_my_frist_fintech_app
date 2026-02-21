// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionResponse _$CreateTransactionResponseFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionResponse(
  message: json['message'] as String,
  status: json['status'] as bool,
);

Map<String, dynamic> _$CreateTransactionResponseToJson(
  _CreateTransactionResponse instance,
) => <String, dynamic>{'message': instance.message, 'status': instance.status};
