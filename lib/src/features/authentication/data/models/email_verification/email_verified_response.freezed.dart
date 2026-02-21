// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verified_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailVerifiedResponse {

 String get status; int get statusCode; String get message; String get accessToken; List<dynamic> get errors;
/// Create a copy of EmailVerifiedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailVerifiedResponseCopyWith<EmailVerifiedResponse> get copyWith => _$EmailVerifiedResponseCopyWithImpl<EmailVerifiedResponse>(this as EmailVerifiedResponse, _$identity);

  /// Serializes this EmailVerifiedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerifiedResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,accessToken,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'EmailVerifiedResponse(status: $status, statusCode: $statusCode, message: $message, accessToken: $accessToken, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $EmailVerifiedResponseCopyWith<$Res>  {
  factory $EmailVerifiedResponseCopyWith(EmailVerifiedResponse value, $Res Function(EmailVerifiedResponse) _then) = _$EmailVerifiedResponseCopyWithImpl;
@useResult
$Res call({
 String status, int statusCode, String message, String accessToken, List<dynamic> errors
});




}
/// @nodoc
class _$EmailVerifiedResponseCopyWithImpl<$Res>
    implements $EmailVerifiedResponseCopyWith<$Res> {
  _$EmailVerifiedResponseCopyWithImpl(this._self, this._then);

  final EmailVerifiedResponse _self;
  final $Res Function(EmailVerifiedResponse) _then;

/// Create a copy of EmailVerifiedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? accessToken = null,Object? errors = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailVerifiedResponse].
extension EmailVerifiedResponsePatterns on EmailVerifiedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailVerifiedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailVerifiedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailVerifiedResponse value)  $default,){
final _that = this;
switch (_that) {
case _EmailVerifiedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailVerifiedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EmailVerifiedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  String accessToken,  List<dynamic> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailVerifiedResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.accessToken,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  String accessToken,  List<dynamic> errors)  $default,) {final _that = this;
switch (_that) {
case _EmailVerifiedResponse():
return $default(_that.status,_that.statusCode,_that.message,_that.accessToken,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int statusCode,  String message,  String accessToken,  List<dynamic> errors)?  $default,) {final _that = this;
switch (_that) {
case _EmailVerifiedResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.accessToken,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailVerifiedResponse implements EmailVerifiedResponse {
  const _EmailVerifiedResponse({required this.status, required this.statusCode, required this.message, required this.accessToken, final  List<dynamic> errors = const []}): _errors = errors;
  factory _EmailVerifiedResponse.fromJson(Map<String, dynamic> json) => _$EmailVerifiedResponseFromJson(json);

@override final  String status;
@override final  int statusCode;
@override final  String message;
@override final  String accessToken;
 final  List<dynamic> _errors;
@override@JsonKey() List<dynamic> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of EmailVerifiedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailVerifiedResponseCopyWith<_EmailVerifiedResponse> get copyWith => __$EmailVerifiedResponseCopyWithImpl<_EmailVerifiedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailVerifiedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailVerifiedResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,accessToken,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'EmailVerifiedResponse(status: $status, statusCode: $statusCode, message: $message, accessToken: $accessToken, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$EmailVerifiedResponseCopyWith<$Res> implements $EmailVerifiedResponseCopyWith<$Res> {
  factory _$EmailVerifiedResponseCopyWith(_EmailVerifiedResponse value, $Res Function(_EmailVerifiedResponse) _then) = __$EmailVerifiedResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int statusCode, String message, String accessToken, List<dynamic> errors
});




}
/// @nodoc
class __$EmailVerifiedResponseCopyWithImpl<$Res>
    implements _$EmailVerifiedResponseCopyWith<$Res> {
  __$EmailVerifiedResponseCopyWithImpl(this._self, this._then);

  final _EmailVerifiedResponse _self;
  final $Res Function(_EmailVerifiedResponse) _then;

/// Create a copy of EmailVerifiedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? accessToken = null,Object? errors = null,}) {
  return _then(_EmailVerifiedResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
