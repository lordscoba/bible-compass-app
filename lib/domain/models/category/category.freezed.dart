// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String? get id => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  bool get forSubscribers => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  DateTime? get dateUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {String? id,
      String categoryName,
      bool forSubscribers,
      List<String> keywords,
      DateTime? dateCreated,
      DateTime? dateUpdated});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = null,
    Object? forSubscribers = null,
    Object? keywords = null,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      forSubscribers: null == forSubscribers
          ? _value.forSubscribers
          : forSubscribers // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$_CategoryModelCopyWith(
          _$_CategoryModel value, $Res Function(_$_CategoryModel) then) =
      __$$_CategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String categoryName,
      bool forSubscribers,
      List<String> keywords,
      DateTime? dateCreated,
      DateTime? dateUpdated});
}

/// @nodoc
class __$$_CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$_CategoryModel>
    implements _$$_CategoryModelCopyWith<$Res> {
  __$$_CategoryModelCopyWithImpl(
      _$_CategoryModel _value, $Res Function(_$_CategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = null,
    Object? forSubscribers = null,
    Object? keywords = null,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_$_CategoryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      forSubscribers: null == forSubscribers
          ? _value.forSubscribers
          : forSubscribers // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CategoryModel implements _CategoryModel {
  _$_CategoryModel(
      {this.id,
      this.categoryName = '',
      this.forSubscribers = false,
      final List<String> keywords = const [],
      this.dateCreated,
      this.dateUpdated})
      : _keywords = keywords;

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String categoryName;
  @override
  @JsonKey()
  final bool forSubscribers;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final DateTime? dateCreated;
  @override
  final DateTime? dateUpdated;

  @override
  String toString() {
    return 'CategoryModel(id: $id, categoryName: $categoryName, forSubscribers: $forSubscribers, keywords: $keywords, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.forSubscribers, forSubscribers) ||
                other.forSubscribers == forSubscribers) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName, forSubscribers,
      const DeepCollectionEquality().hash(_keywords), dateCreated, dateUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      __$$_CategoryModelCopyWithImpl<_$_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryModelToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  factory _CategoryModel(
      {final String? id,
      final String categoryName,
      final bool forSubscribers,
      final List<String> keywords,
      final DateTime? dateCreated,
      final DateTime? dateUpdated}) = _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  String? get id;
  @override
  String get categoryName;
  @override
  bool get forSubscribers;
  @override
  List<String> get keywords;
  @override
  DateTime? get dateCreated;
  @override
  DateTime? get dateUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_CatogoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$_CatogoryStateCopyWith(
          _$_CatogoryState value, $Res Function(_$_CatogoryState) then) =
      __$$_CatogoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> data,
      bool isLoading,
      String error,
      bool isLoggedIn});
}

/// @nodoc
class __$$_CatogoryStateCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_CatogoryState>
    implements _$$_CatogoryStateCopyWith<$Res> {
  __$$_CatogoryStateCopyWithImpl(
      _$_CatogoryState _value, $Res Function(_$_CatogoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_$_CatogoryState(
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

class _$_CatogoryState implements _CatogoryState {
  const _$_CatogoryState(
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
    return 'CategoryState(data: $data, isLoading: $isLoading, error: $error, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatogoryState &&
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
  _$$_CatogoryStateCopyWith<_$_CatogoryState> get copyWith =>
      __$$_CatogoryStateCopyWithImpl<_$_CatogoryState>(this, _$identity);
}

abstract class _CatogoryState implements CategoryState {
  const factory _CatogoryState(
      {final Map<String, dynamic> data,
      final bool isLoading,
      final String error,
      final bool isLoggedIn}) = _$_CatogoryState;

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
  _$$_CatogoryStateCopyWith<_$_CatogoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
