// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionResponse _$CreateTransactionResponseFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionResponse(
  statusCode: (json['statusCode'] as num).toInt(),
  status: json['status'] as bool,
);

Map<String, dynamic> _$CreateTransactionResponseToJson(
  _CreateTransactionResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'status': instance.status,
};
