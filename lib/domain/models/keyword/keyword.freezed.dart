// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyword.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeywordModel _$KeywordModelFromJson(Map<String, dynamic> json) {
  return _KeywordModel.fromJson(json);
}

/// @nodoc
mixin _$KeywordModel {
  String? get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  bool get forSubscribers => throw _privateConstructorUsedError;
  List<VerseModel> get bibleVerse => throw _privateConstructorUsedError;
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  DateTime? get dateUpdated => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeywordModelCopyWith<KeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordModelCopyWith<$Res> {
  factory $KeywordModelCopyWith(
          KeywordModel value, $Res Function(KeywordModel) then) =
      _$KeywordModelCopyWithImpl<$Res, KeywordModel>;
  @useResult
  $Res call(
      {String? id,
      String categoryId,
      String keyword,
      bool forSubscribers,
      List<VerseModel> bibleVerse,
      DateTime? dateCreated,
      DateTime? dateUpdated,
      bool favorite});
}

/// @nodoc
class _$KeywordModelCopyWithImpl<$Res, $Val extends KeywordModel>
    implements $KeywordModelCopyWith<$Res> {
  _$KeywordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? keyword = null,
    Object? forSubscribers = null,
    Object? bibleVerse = null,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      forSubscribers: null == forSubscribers
          ? _value.forSubscribers
          : forSubscribers // ignore: cast_nullable_to_non_nullable
              as bool,
      bibleVerse: null == bibleVerse
          ? _value.bibleVerse
          : bibleVerse // ignore: cast_nullable_to_non_nullable
              as List<VerseModel>,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeywordModelCopyWith<$Res>
    implements $KeywordModelCopyWith<$Res> {
  factory _$$_KeywordModelCopyWith(
          _$_KeywordModel value, $Res Function(_$_KeywordModel) then) =
      __$$_KeywordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String categoryId,
      String keyword,
      bool forSubscribers,
      List<VerseModel> bibleVerse,
      DateTime? dateCreated,
      DateTime? dateUpdated,
      bool favorite});
}

/// @nodoc
class __$$_KeywordModelCopyWithImpl<$Res>
    extends _$KeywordModelCopyWithImpl<$Res, _$_KeywordModel>
    implements _$$_KeywordModelCopyWith<$Res> {
  __$$_KeywordModelCopyWithImpl(
      _$_KeywordModel _value, $Res Function(_$_KeywordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? keyword = null,
    Object? forSubscribers = null,
    Object? bibleVerse = null,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
    Object? favorite = null,
  }) {
    return _then(_$_KeywordModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      forSubscribers: null == forSubscribers
          ? _value.forSubscribers
          : forSubscribers // ignore: cast_nullable_to_non_nullable
              as bool,
      bibleVerse: null == bibleVerse
          ? _value._bibleVerse
          : bibleVerse // ignore: cast_nullable_to_non_nullable
              as List<VerseModel>,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_KeywordModel implements _KeywordModel {
  _$_KeywordModel(
      {this.id,
      this.categoryId = '',
      this.keyword = '',
      this.forSubscribers = false,
      final List<VerseModel> bibleVerse = const [],
      this.dateCreated,
      this.dateUpdated,
      this.favorite = false})
      : _bibleVerse = bibleVerse;

  factory _$_KeywordModel.fromJson(Map<String, dynamic> json) =>
      _$$_KeywordModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String categoryId;
  @override
  @JsonKey()
  final String keyword;
  @override
  @JsonKey()
  final bool forSubscribers;
  final List<VerseModel> _bibleVerse;
  @override
  @JsonKey()
  List<VerseModel> get bibleVerse {
    if (_bibleVerse is EqualUnmodifiableListView) return _bibleVerse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bibleVerse);
  }

  @override
  final DateTime? dateCreated;
  @override
  final DateTime? dateUpdated;
  @override
  @JsonKey()
  final bool favorite;

  @override
  String toString() {
    return 'KeywordModel(id: $id, categoryId: $categoryId, keyword: $keyword, forSubscribers: $forSubscribers, bibleVerse: $bibleVerse, dateCreated: $dateCreated, dateUpdated: $dateUpdated, favorite: $favorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeywordModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.forSubscribers, forSubscribers) ||
                other.forSubscribers == forSubscribers) &&
            const DeepCollectionEquality()
                .equals(other._bibleVerse, _bibleVerse) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      keyword,
      forSubscribers,
      const DeepCollectionEquality().hash(_bibleVerse),
      dateCreated,
      dateUpdated,
      favorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeywordModelCopyWith<_$_KeywordModel> get copyWith =>
      __$$_KeywordModelCopyWithImpl<_$_KeywordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeywordModelToJson(
      this,
    );
  }
}

abstract class _KeywordModel implements KeywordModel {
  factory _KeywordModel(
      {final String? id,
      final String categoryId,
      final String keyword,
      final bool forSubscribers,
      final List<VerseModel> bibleVerse,
      final DateTime? dateCreated,
      final DateTime? dateUpdated,
      final bool favorite}) = _$_KeywordModel;

  factory _KeywordModel.fromJson(Map<String, dynamic> json) =
      _$_KeywordModel.fromJson;

  @override
  String? get id;
  @override
  String get categoryId;
  @override
  String get keyword;
  @override
  bool get forSubscribers;
  @override
  List<VerseModel> get bibleVerse;
  @override
  DateTime? get dateCreated;
  @override
  DateTime? get dateUpdated;
  @override
  bool get favorite;
  @override
  @JsonKey(ignore: true)
  _$$_KeywordModelCopyWith<_$_KeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KeywordState {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeywordStateCopyWith<KeywordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordStateCopyWith<$Res> {
  factory $KeywordStateCopyWith(
          KeywordState value, $Res Function(KeywordState) then) =
      _$KeywordStateCopyWithImpl<$Res, KeywordState>;
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class _$KeywordStateCopyWithImpl<$Res, $Val extends KeywordState>
    implements $KeywordStateCopyWith<$Res> {
  _$KeywordStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_KeywordStateCopyWith<$Res>
    implements $KeywordStateCopyWith<$Res> {
  factory _$$_KeywordStateCopyWith(
          _$_KeywordState value, $Res Function(_$_KeywordState) then) =
      __$$_KeywordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class __$$_KeywordStateCopyWithImpl<$Res>
    extends _$KeywordStateCopyWithImpl<$Res, _$_KeywordState>
    implements _$$_KeywordStateCopyWith<$Res> {
  __$$_KeywordStateCopyWithImpl(
      _$_KeywordState _value, $Res Function(_$_KeywordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_$_KeywordState(
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

class _$_KeywordState implements _KeywordState {
  const _$_KeywordState(
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
    return 'KeywordState(data: $data, isLoading: $isLoading, error: $error, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeywordState &&
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
  _$$_KeywordStateCopyWith<_$_KeywordState> get copyWith =>
      __$$_KeywordStateCopyWithImpl<_$_KeywordState>(this, _$identity);
}

abstract class _KeywordState implements KeywordState {
  const factory _KeywordState(
      {final Map<String, dynamic> data,
      final bool isLoading,
      final String error,
      final bool isLoggedIn}) = _$_KeywordState;

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
  _$$_KeywordStateCopyWith<_$_KeywordState> get copyWith =>
      throw _privateConstructorUsedError;
}
