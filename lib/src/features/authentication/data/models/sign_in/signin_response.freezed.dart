// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SigninResponse {

 String get status; int get statusCode; String get message; String get token; List<dynamic> get errors;
/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninResponseCopyWith<SigninResponse> get copyWith => _$SigninResponseCopyWithImpl<SigninResponse>(this as SigninResponse, _$identity);

  /// Serializes this SigninResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,token,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, token: $token, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $SigninResponseCopyWith<$Res>  {
  factory $SigninResponseCopyWith(SigninResponse value, $Res Function(SigninResponse) _then) = _$SigninResponseCopyWithImpl;
@useResult
$Res call({
 String status, int statusCode, String message, String token, List<dynamic> errors
});




}
/// @nodoc
class _$SigninResponseCopyWithImpl<$Res>
    implements $SigninResponseCopyWith<$Res> {
  _$SigninResponseCopyWithImpl(this._self, this._then);

  final SigninResponse _self;
  final $Res Function(SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? token = null,Object? errors = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SigninResponse].
extension SigninResponsePatterns on SigninResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SigninResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SigninResponse value)  $default,){
final _that = this;
switch (_that) {
case _SigninResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SigninResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  String token,  List<dynamic> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.token,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  String token,  List<dynamic> errors)  $default,) {final _that = this;
switch (_that) {
case _SigninResponse():
return $default(_that.status,_that.statusCode,_that.message,_that.token,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int statusCode,  String message,  String token,  List<dynamic> errors)?  $default,) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.token,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SigninResponse implements SigninResponse {
  const _SigninResponse({required this.status, required this.statusCode, required this.message, required this.token, required final  List<dynamic> errors}): _errors = errors;
  factory _SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

@override final  String status;
@override final  int statusCode;
@override final  String message;
@override final  String token;
 final  List<dynamic> _errors;
@override List<dynamic> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninResponseCopyWith<_SigninResponse> get copyWith => __$SigninResponseCopyWithImpl<_SigninResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SigninResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,token,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, token: $token, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SigninResponseCopyWith<$Res> implements $SigninResponseCopyWith<$Res> {
  factory _$SigninResponseCopyWith(_SigninResponse value, $Res Function(_SigninResponse) _then) = __$SigninResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int statusCode, String message, String token, List<dynamic> errors
});




}
/// @nodoc
class __$SigninResponseCopyWithImpl<$Res>
    implements _$SigninResponseCopyWith<$Res> {
  __$SigninResponseCopyWithImpl(this._self, this._then);

  final _SigninResponse _self;
  final $Res Function(_SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? token = null,Object? errors = null,}) {
  return _then(_SigninResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
