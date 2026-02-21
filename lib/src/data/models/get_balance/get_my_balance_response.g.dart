// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetMyBalance _$GetMyBalanceFromJson(Map<String, dynamic> json) =>
    _GetMyBalance(
      statusCode: (json['statusCode'] as num).toInt(),
      status: json['status'] as bool,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$GetMyBalanceToJson(_GetMyBalance instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'balance': instance.balance,
      'currency': instance.currency,
    };
