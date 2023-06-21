// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteState {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
  @useResult
  $Res call({Map<String, dynamic> data, bool isLoading, String error});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$_FavoriteStateCopyWith(
          _$_FavoriteState value, $Res Function(_$_FavoriteState) then) =
      __$$_FavoriteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data, bool isLoading, String error});
}

/// @nodoc
class __$$_FavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$_FavoriteState>
    implements _$$_FavoriteStateCopyWith<$Res> {
  __$$_FavoriteStateCopyWithImpl(
      _$_FavoriteState _value, $Res Function(_$_FavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$_FavoriteState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FavoriteState implements _FavoriteState {
  const _$_FavoriteState(
      {final Map<String, dynamic> data = const {},
      this.isLoading = false,
      this.error = ''})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'FavoriteState(data: $data, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      __$$_FavoriteStateCopyWithImpl<_$_FavoriteState>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {final Map<String, dynamic> data,
      final bool isLoading,
      final String error}) = _$_FavoriteState;

  @override
  Map<String, dynamic> get data;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
