// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_my_balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetMyBalance {

 int get statusCode; bool get status; double get balance; String get currency;
/// Create a copy of GetMyBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMyBalanceCopyWith<GetMyBalance> get copyWith => _$GetMyBalanceCopyWithImpl<GetMyBalance>(this as GetMyBalance, _$identity);

  /// Serializes this GetMyBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMyBalance&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,status,balance,currency);

@override
String toString() {
  return 'GetMyBalance(statusCode: $statusCode, status: $status, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $GetMyBalanceCopyWith<$Res>  {
  factory $GetMyBalanceCopyWith(GetMyBalance value, $Res Function(GetMyBalance) _then) = _$GetMyBalanceCopyWithImpl;
@useResult
$Res call({
 int statusCode, bool status, double balance, String currency
});




}
/// @nodoc
class _$GetMyBalanceCopyWithImpl<$Res>
    implements $GetMyBalanceCopyWith<$Res> {
  _$GetMyBalanceCopyWithImpl(this._self, this._then);

  final GetMyBalance _self;
  final $Res Function(GetMyBalance) _then;

/// Create a copy of GetMyBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? status = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetMyBalance].
extension GetMyBalancePatterns on GetMyBalance {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetMyBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMyBalance() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetMyBalance value)  $default,){
final _that = this;
switch (_that) {
case _GetMyBalance():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetMyBalance value)?  $default,){
final _that = this;
switch (_that) {
case _GetMyBalance() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int statusCode,  bool status,  double balance,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMyBalance() when $default != null:
return $default(_that.statusCode,_that.status,_that.balance,_that.currency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int statusCode,  bool status,  double balance,  String currency)  $default,) {final _that = this;
switch (_that) {
case _GetMyBalance():
return $default(_that.statusCode,_that.status,_that.balance,_that.currency);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int statusCode,  bool status,  double balance,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _GetMyBalance() when $default != null:
return $default(_that.statusCode,_that.status,_that.balance,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetMyBalance implements GetMyBalance {
  const _GetMyBalance({required this.statusCode, required this.status, required this.balance, required this.currency});
  factory _GetMyBalance.fromJson(Map<String, dynamic> json) => _$GetMyBalanceFromJson(json);

@override final  int statusCode;
@override final  bool status;
@override final  double balance;
@override final  String currency;

/// Create a copy of GetMyBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMyBalanceCopyWith<_GetMyBalance> get copyWith => __$GetMyBalanceCopyWithImpl<_GetMyBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetMyBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMyBalance&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,status,balance,currency);

@override
String toString() {
  return 'GetMyBalance(statusCode: $statusCode, status: $status, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$GetMyBalanceCopyWith<$Res> implements $GetMyBalanceCopyWith<$Res> {
  factory _$GetMyBalanceCopyWith(_GetMyBalance value, $Res Function(_GetMyBalance) _then) = __$GetMyBalanceCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, bool status, double balance, String currency
});




}
/// @nodoc
class __$GetMyBalanceCopyWithImpl<$Res>
    implements _$GetMyBalanceCopyWith<$Res> {
  __$GetMyBalanceCopyWithImpl(this._self, this._then);

  final _GetMyBalance _self;
  final $Res Function(_GetMyBalance) _then;

/// Create a copy of GetMyBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? status = null,Object? balance = null,Object? currency = null,}) {
  return _then(_GetMyBalance(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
