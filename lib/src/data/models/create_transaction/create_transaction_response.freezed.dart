// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransactionResponse {

 String get message; bool get status;
/// Create a copy of CreateTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionResponseCopyWith<CreateTransactionResponse> get copyWith => _$CreateTransactionResponseCopyWithImpl<CreateTransactionResponse>(this as CreateTransactionResponse, _$identity);

  /// Serializes this CreateTransactionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status);

@override
String toString() {
  return 'CreateTransactionResponse(message: $message, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionResponseCopyWith<$Res>  {
  factory $CreateTransactionResponseCopyWith(CreateTransactionResponse value, $Res Function(CreateTransactionResponse) _then) = _$CreateTransactionResponseCopyWithImpl;
@useResult
$Res call({
 String message, bool status
});




}
/// @nodoc
class _$CreateTransactionResponseCopyWithImpl<$Res>
    implements $CreateTransactionResponseCopyWith<$Res> {
  _$CreateTransactionResponseCopyWithImpl(this._self, this._then);

  final CreateTransactionResponse _self;
  final $Res Function(CreateTransactionResponse) _then;

/// Create a copy of CreateTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? status = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionResponse].
extension CreateTransactionResponsePatterns on CreateTransactionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  bool status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionResponse() when $default != null:
return $default(_that.message,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  bool status)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionResponse():
return $default(_that.message,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  bool status)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionResponse() when $default != null:
return $default(_that.message,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransactionResponse implements CreateTransactionResponse {
  const _CreateTransactionResponse({required this.message, required this.status});
  factory _CreateTransactionResponse.fromJson(Map<String, dynamic> json) => _$CreateTransactionResponseFromJson(json);

@override final  String message;
@override final  bool status;

/// Create a copy of CreateTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionResponseCopyWith<_CreateTransactionResponse> get copyWith => __$CreateTransactionResponseCopyWithImpl<_CreateTransactionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status);

@override
String toString() {
  return 'CreateTransactionResponse(message: $message, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionResponseCopyWith<$Res> implements $CreateTransactionResponseCopyWith<$Res> {
  factory _$CreateTransactionResponseCopyWith(_CreateTransactionResponse value, $Res Function(_CreateTransactionResponse) _then) = __$CreateTransactionResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, bool status
});




}
/// @nodoc
class __$CreateTransactionResponseCopyWithImpl<$Res>
    implements _$CreateTransactionResponseCopyWith<$Res> {
  __$CreateTransactionResponseCopyWithImpl(this._self, this._then);

  final _CreateTransactionResponse _self;
  final $Res Function(_CreateTransactionResponse) _then;

/// Create a copy of CreateTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? status = null,}) {
  return _then(_CreateTransactionResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
