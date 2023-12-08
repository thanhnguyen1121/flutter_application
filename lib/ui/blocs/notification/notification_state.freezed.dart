// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotificationStateData value) $default, {
    required TResult Function(NotificationStateLoading value) loading,
    required TResult Function(NotificationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NotificationStateData value)? $default, {
    TResult? Function(NotificationStateLoading value)? loading,
    TResult? Function(NotificationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotificationStateData value)? $default, {
    TResult Function(NotificationStateLoading value)? loading,
    TResult Function(NotificationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationStateDataImplCopyWith<$Res> {
  factory _$$NotificationStateDataImplCopyWith(
          _$NotificationStateDataImpl value,
          $Res Function(_$NotificationStateDataImpl) then) =
      __$$NotificationStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationDto> dataList, int unReadCount});
}

/// @nodoc
class __$$NotificationStateDataImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateDataImpl>
    implements _$$NotificationStateDataImplCopyWith<$Res> {
  __$$NotificationStateDataImplCopyWithImpl(_$NotificationStateDataImpl _value,
      $Res Function(_$NotificationStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataList = null,
    Object? unReadCount = null,
  }) {
    return _then(_$NotificationStateDataImpl(
      null == dataList
          ? _value._dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
      null == unReadCount
          ? _value.unReadCount
          : unReadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NotificationStateDataImpl implements NotificationStateData {
  const _$NotificationStateDataImpl(
      final List<NotificationDto> dataList, this.unReadCount)
      : _dataList = dataList;

  final List<NotificationDto> _dataList;
  @override
  List<NotificationDto> get dataList {
    if (_dataList is EqualUnmodifiableListView) return _dataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  @override
  final int unReadCount;

  @override
  String toString() {
    return 'NotificationState(dataList: $dataList, unReadCount: $unReadCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateDataImpl &&
            const DeepCollectionEquality().equals(other._dataList, _dataList) &&
            (identical(other.unReadCount, unReadCount) ||
                other.unReadCount == unReadCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_dataList), unReadCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateDataImplCopyWith<_$NotificationStateDataImpl>
      get copyWith => __$$NotificationStateDataImplCopyWithImpl<
          _$NotificationStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(dataList, unReadCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(dataList, unReadCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(dataList, unReadCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotificationStateData value) $default, {
    required TResult Function(NotificationStateLoading value) loading,
    required TResult Function(NotificationStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NotificationStateData value)? $default, {
    TResult? Function(NotificationStateLoading value)? loading,
    TResult? Function(NotificationStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotificationStateData value)? $default, {
    TResult Function(NotificationStateLoading value)? loading,
    TResult Function(NotificationStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class NotificationStateData implements NotificationState {
  const factory NotificationStateData(
          final List<NotificationDto> dataList, final int unReadCount) =
      _$NotificationStateDataImpl;

  List<NotificationDto> get dataList;
  int get unReadCount;
  @JsonKey(ignore: true)
  _$$NotificationStateDataImplCopyWith<_$NotificationStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationStateLoadingImplCopyWith<$Res> {
  factory _$$NotificationStateLoadingImplCopyWith(
          _$NotificationStateLoadingImpl value,
          $Res Function(_$NotificationStateLoadingImpl) then) =
      __$$NotificationStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationStateLoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$NotificationStateLoadingImpl>
    implements _$$NotificationStateLoadingImplCopyWith<$Res> {
  __$$NotificationStateLoadingImplCopyWithImpl(
      _$NotificationStateLoadingImpl _value,
      $Res Function(_$NotificationStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationStateLoadingImpl implements NotificationStateLoading {
  const _$NotificationStateLoadingImpl();

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotificationStateData value) $default, {
    required TResult Function(NotificationStateLoading value) loading,
    required TResult Function(NotificationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NotificationStateData value)? $default, {
    TResult? Function(NotificationStateLoading value)? loading,
    TResult? Function(NotificationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotificationStateData value)? $default, {
    TResult Function(NotificationStateLoading value)? loading,
    TResult Function(NotificationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotificationStateLoading implements NotificationState {
  const factory NotificationStateLoading() = _$NotificationStateLoadingImpl;
}

/// @nodoc
abstract class _$$NotificationStateErrorImplCopyWith<$Res> {
  factory _$$NotificationStateErrorImplCopyWith(
          _$NotificationStateErrorImpl value,
          $Res Function(_$NotificationStateErrorImpl) then) =
      __$$NotificationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$NotificationStateErrorImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateErrorImpl>
    implements _$$NotificationStateErrorImplCopyWith<$Res> {
  __$$NotificationStateErrorImplCopyWithImpl(
      _$NotificationStateErrorImpl _value,
      $Res Function(_$NotificationStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$NotificationStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$NotificationStateErrorImpl implements NotificationStateError {
  const _$NotificationStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'NotificationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateErrorImplCopyWith<_$NotificationStateErrorImpl>
      get copyWith => __$$NotificationStateErrorImplCopyWithImpl<
          _$NotificationStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NotificationDto> dataList, int unReadCount)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotificationStateData value) $default, {
    required TResult Function(NotificationStateLoading value) loading,
    required TResult Function(NotificationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NotificationStateData value)? $default, {
    TResult? Function(NotificationStateLoading value)? loading,
    TResult? Function(NotificationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotificationStateData value)? $default, {
    TResult Function(NotificationStateLoading value)? loading,
    TResult Function(NotificationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NotificationStateError implements NotificationState {
  const factory NotificationStateError(final dynamic error) =
      _$NotificationStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$NotificationStateErrorImplCopyWith<_$NotificationStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
