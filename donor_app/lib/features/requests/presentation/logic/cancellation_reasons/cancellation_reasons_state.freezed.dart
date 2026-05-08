// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancellation_reasons_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancellationReasonsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancellationReasonsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancellationReasonsState()';
}


}

/// @nodoc
class $CancellationReasonsStateCopyWith<$Res>  {
$CancellationReasonsStateCopyWith(CancellationReasonsState _, $Res Function(CancellationReasonsState) __);
}


/// Adds pattern-matching-related methods to [CancellationReasonsState].
extension CancellationReasonsStatePatterns on CancellationReasonsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CancellationReasonsInitial value)?  initial,TResult Function( CancellationReasonsLoading value)?  loading,TResult Function( CancellationReasonsSuccess value)?  success,TResult Function( CancellationReasonsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancellationReasonsInitial() when initial != null:
return initial(_that);case CancellationReasonsLoading() when loading != null:
return loading(_that);case CancellationReasonsSuccess() when success != null:
return success(_that);case CancellationReasonsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CancellationReasonsInitial value)  initial,required TResult Function( CancellationReasonsLoading value)  loading,required TResult Function( CancellationReasonsSuccess value)  success,required TResult Function( CancellationReasonsError value)  error,}){
final _that = this;
switch (_that) {
case _CancellationReasonsInitial():
return initial(_that);case CancellationReasonsLoading():
return loading(_that);case CancellationReasonsSuccess():
return success(_that);case CancellationReasonsError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CancellationReasonsInitial value)?  initial,TResult? Function( CancellationReasonsLoading value)?  loading,TResult? Function( CancellationReasonsSuccess value)?  success,TResult? Function( CancellationReasonsError value)?  error,}){
final _that = this;
switch (_that) {
case _CancellationReasonsInitial() when initial != null:
return initial(_that);case CancellationReasonsLoading() when loading != null:
return loading(_that);case CancellationReasonsSuccess() when success != null:
return success(_that);case CancellationReasonsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ReasonsCancellationDonationEntity> reasons)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancellationReasonsInitial() when initial != null:
return initial();case CancellationReasonsLoading() when loading != null:
return loading();case CancellationReasonsSuccess() when success != null:
return success(_that.reasons);case CancellationReasonsError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ReasonsCancellationDonationEntity> reasons)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case _CancellationReasonsInitial():
return initial();case CancellationReasonsLoading():
return loading();case CancellationReasonsSuccess():
return success(_that.reasons);case CancellationReasonsError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ReasonsCancellationDonationEntity> reasons)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case _CancellationReasonsInitial() when initial != null:
return initial();case CancellationReasonsLoading() when loading != null:
return loading();case CancellationReasonsSuccess() when success != null:
return success(_that.reasons);case CancellationReasonsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CancellationReasonsInitial implements CancellationReasonsState {
  const _CancellationReasonsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancellationReasonsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancellationReasonsState.initial()';
}


}




/// @nodoc


class CancellationReasonsLoading implements CancellationReasonsState {
  const CancellationReasonsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancellationReasonsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancellationReasonsState.loading()';
}


}




/// @nodoc


class CancellationReasonsSuccess implements CancellationReasonsState {
  const CancellationReasonsSuccess(final  List<ReasonsCancellationDonationEntity> reasons): _reasons = reasons;
  

 final  List<ReasonsCancellationDonationEntity> _reasons;
 List<ReasonsCancellationDonationEntity> get reasons {
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasons);
}


/// Create a copy of CancellationReasonsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancellationReasonsSuccessCopyWith<CancellationReasonsSuccess> get copyWith => _$CancellationReasonsSuccessCopyWithImpl<CancellationReasonsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancellationReasonsSuccess&&const DeepCollectionEquality().equals(other._reasons, _reasons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reasons));

@override
String toString() {
  return 'CancellationReasonsState.success(reasons: $reasons)';
}


}

/// @nodoc
abstract mixin class $CancellationReasonsSuccessCopyWith<$Res> implements $CancellationReasonsStateCopyWith<$Res> {
  factory $CancellationReasonsSuccessCopyWith(CancellationReasonsSuccess value, $Res Function(CancellationReasonsSuccess) _then) = _$CancellationReasonsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ReasonsCancellationDonationEntity> reasons
});




}
/// @nodoc
class _$CancellationReasonsSuccessCopyWithImpl<$Res>
    implements $CancellationReasonsSuccessCopyWith<$Res> {
  _$CancellationReasonsSuccessCopyWithImpl(this._self, this._then);

  final CancellationReasonsSuccess _self;
  final $Res Function(CancellationReasonsSuccess) _then;

/// Create a copy of CancellationReasonsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reasons = null,}) {
  return _then(CancellationReasonsSuccess(
null == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<ReasonsCancellationDonationEntity>,
  ));
}


}

/// @nodoc


class CancellationReasonsError implements CancellationReasonsState {
  const CancellationReasonsError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of CancellationReasonsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancellationReasonsErrorCopyWith<CancellationReasonsError> get copyWith => _$CancellationReasonsErrorCopyWithImpl<CancellationReasonsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancellationReasonsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CancellationReasonsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CancellationReasonsErrorCopyWith<$Res> implements $CancellationReasonsStateCopyWith<$Res> {
  factory $CancellationReasonsErrorCopyWith(CancellationReasonsError value, $Res Function(CancellationReasonsError) _then) = _$CancellationReasonsErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$CancellationReasonsErrorCopyWithImpl<$Res>
    implements $CancellationReasonsErrorCopyWith<$Res> {
  _$CancellationReasonsErrorCopyWithImpl(this._self, this._then);

  final CancellationReasonsError _self;
  final $Res Function(CancellationReasonsError) _then;

/// Create a copy of CancellationReasonsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CancellationReasonsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
