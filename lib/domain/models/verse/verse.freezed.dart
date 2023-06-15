// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerseModel _$VerseModelFromJson(Map<String, dynamic> json) {
  return _VerseModel.fromJson(json);
}

/// @nodoc
mixin _$VerseModel {
  String? get id => throw _privateConstructorUsedError;
  String get bibleVerse => throw _privateConstructorUsedError;
  List<dynamic> get relatedVerses => throw _privateConstructorUsedError;
  String get passage => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;
  DateTime? get dateCreated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerseModelCopyWith<VerseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerseModelCopyWith<$Res> {
  factory $VerseModelCopyWith(
          VerseModel value, $Res Function(VerseModel) then) =
      _$VerseModelCopyWithImpl<$Res, VerseModel>;
  @useResult
  $Res call(
      {String? id,
      String bibleVerse,
      List<dynamic> relatedVerses,
      String passage,
      String explanation,
      bool like,
      DateTime? dateCreated});
}

/// @nodoc
class _$VerseModelCopyWithImpl<$Res, $Val extends VerseModel>
    implements $VerseModelCopyWith<$Res> {
  _$VerseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bibleVerse = null,
    Object? relatedVerses = null,
    Object? passage = null,
    Object? explanation = null,
    Object? like = null,
    Object? dateCreated = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bibleVerse: null == bibleVerse
          ? _value.bibleVerse
          : bibleVerse // ignore: cast_nullable_to_non_nullable
              as String,
      relatedVerses: null == relatedVerses
          ? _value.relatedVerses
          : relatedVerses // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      passage: null == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerseModelCopyWith<$Res>
    implements $VerseModelCopyWith<$Res> {
  factory _$$_VerseModelCopyWith(
          _$_VerseModel value, $Res Function(_$_VerseModel) then) =
      __$$_VerseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String bibleVerse,
      List<dynamic> relatedVerses,
      String passage,
      String explanation,
      bool like,
      DateTime? dateCreated});
}

/// @nodoc
class __$$_VerseModelCopyWithImpl<$Res>
    extends _$VerseModelCopyWithImpl<$Res, _$_VerseModel>
    implements _$$_VerseModelCopyWith<$Res> {
  __$$_VerseModelCopyWithImpl(
      _$_VerseModel _value, $Res Function(_$_VerseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bibleVerse = null,
    Object? relatedVerses = null,
    Object? passage = null,
    Object? explanation = null,
    Object? like = null,
    Object? dateCreated = freezed,
  }) {
    return _then(_$_VerseModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bibleVerse: null == bibleVerse
          ? _value.bibleVerse
          : bibleVerse // ignore: cast_nullable_to_non_nullable
              as String,
      relatedVerses: null == relatedVerses
          ? _value._relatedVerses
          : relatedVerses // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      passage: null == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_VerseModel implements _VerseModel {
  _$_VerseModel(
      {this.id,
      this.bibleVerse = '',
      final List<dynamic> relatedVerses = const [],
      this.passage = '',
      this.explanation = '',
      this.like = false,
      this.dateCreated})
      : _relatedVerses = relatedVerses;

  factory _$_VerseModel.fromJson(Map<String, dynamic> json) =>
      _$$_VerseModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String bibleVerse;
  final List<dynamic> _relatedVerses;
  @override
  @JsonKey()
  List<dynamic> get relatedVerses {
    if (_relatedVerses is EqualUnmodifiableListView) return _relatedVerses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVerses);
  }

  @override
  @JsonKey()
  final String passage;
  @override
  @JsonKey()
  final String explanation;
  @override
  @JsonKey()
  final bool like;
  @override
  final DateTime? dateCreated;

  @override
  String toString() {
    return 'VerseModel(id: $id, bibleVerse: $bibleVerse, relatedVerses: $relatedVerses, passage: $passage, explanation: $explanation, like: $like, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bibleVerse, bibleVerse) ||
                other.bibleVerse == bibleVerse) &&
            const DeepCollectionEquality()
                .equals(other._relatedVerses, _relatedVerses) &&
            (identical(other.passage, passage) || other.passage == passage) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bibleVerse,
      const DeepCollectionEquality().hash(_relatedVerses),
      passage,
      explanation,
      like,
      dateCreated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerseModelCopyWith<_$_VerseModel> get copyWith =>
      __$$_VerseModelCopyWithImpl<_$_VerseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerseModelToJson(
      this,
    );
  }
}

abstract class _VerseModel implements VerseModel {
  factory _VerseModel(
      {final String? id,
      final String bibleVerse,
      final List<dynamic> relatedVerses,
      final String passage,
      final String explanation,
      final bool like,
      final DateTime? dateCreated}) = _$_VerseModel;

  factory _VerseModel.fromJson(Map<String, dynamic> json) =
      _$_VerseModel.fromJson;

  @override
  String? get id;
  @override
  String get bibleVerse;
  @override
  List<dynamic> get relatedVerses;
  @override
  String get passage;
  @override
  String get explanation;
  @override
  bool get like;
  @override
  DateTime? get dateCreated;
  @override
  @JsonKey(ignore: true)
  _$$_VerseModelCopyWith<_$_VerseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerseState {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerseStateCopyWith<VerseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerseStateCopyWith<$Res> {
  factory $VerseStateCopyWith(
          VerseState value, $Res Function(VerseState) then) =
      _$VerseStateCopyWithImpl<$Res, VerseState>;
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class _$VerseStateCopyWithImpl<$Res, $Val extends VerseState>
    implements $VerseStateCopyWith<$Res> {
  _$VerseStateCopyWithImpl(this._value, this._then);

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
    Object? isLoggedIn = null,
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
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerseStateCopyWith<$Res>
    implements $VerseStateCopyWith<$Res> {
  factory _$$_VerseStateCopyWith(
          _$_VerseState value, $Res Function(_$_VerseState) then) =
      __$$_VerseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class __$$_VerseStateCopyWithImpl<$Res>
    extends _$VerseStateCopyWithImpl<$Res, _$_VerseState>
    implements _$$_VerseStateCopyWith<$Res> {
  __$$_VerseStateCopyWithImpl(
      _$_VerseState _value, $Res Function(_$_VerseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_$_VerseState(
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
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VerseState implements _VerseState {
  const _$_VerseState(
      {final Map<String, dynamic> data = const {},
      this.isLoading = false,
      this.error = '',
      this.isLoggedIn = false})
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
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'VerseState(data: $data, isLoading: $isLoading, error: $error, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerseState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), isLoading, error, isLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerseStateCopyWith<_$_VerseState> get copyWith =>
      __$$_VerseStateCopyWithImpl<_$_VerseState>(this, _$identity);
}

abstract class _VerseState implements VerseState {
  const factory _VerseState(
      {final Map<String, dynamic> data,
      final bool isLoading,
      final String error,
      final bool isLoggedIn}) = _$_VerseState;

  @override
  Map<String, dynamic> get data;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  bool get isLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$_VerseStateCopyWith<_$_VerseState> get copyWith =>
      throw _privateConstructorUsedError;
}
