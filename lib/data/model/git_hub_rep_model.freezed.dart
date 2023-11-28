// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'git_hub_rep_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GitHubRepModel _$GitHubRepModelFromJson(Map<String, dynamic> json) {
  return _GitHubRepoModel.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitHubRepModelCopyWith<GitHubRepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepModelCopyWith<$Res> {
  factory $GitHubRepModelCopyWith(
          GitHubRepModel value, $Res Function(GitHubRepModel) then) =
      _$GitHubRepModelCopyWithImpl<$Res, GitHubRepModel>;
  @useResult
  $Res call({int id, String name, bool isFavorite});
}

/// @nodoc
class _$GitHubRepModelCopyWithImpl<$Res, $Val extends GitHubRepModel>
    implements $GitHubRepModelCopyWith<$Res> {
  _$GitHubRepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubRepoModelImplCopyWith<$Res>
    implements $GitHubRepModelCopyWith<$Res> {
  factory _$$GitHubRepoModelImplCopyWith(_$GitHubRepoModelImpl value,
          $Res Function(_$GitHubRepoModelImpl) then) =
      __$$GitHubRepoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, bool isFavorite});
}

/// @nodoc
class __$$GitHubRepoModelImplCopyWithImpl<$Res>
    extends _$GitHubRepModelCopyWithImpl<$Res, _$GitHubRepoModelImpl>
    implements _$$GitHubRepoModelImplCopyWith<$Res> {
  __$$GitHubRepoModelImplCopyWithImpl(
      _$GitHubRepoModelImpl _value, $Res Function(_$GitHubRepoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isFavorite = null,
  }) {
    return _then(_$GitHubRepoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepoModelImpl implements _GitHubRepoModel {
  const _$GitHubRepoModelImpl(
      {required this.id, required this.name, this.isFavorite = false});

  factory _$GitHubRepoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'GitHubRepModel(id: $id, name: $name, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepoModelImplCopyWith<_$GitHubRepoModelImpl> get copyWith =>
      __$$GitHubRepoModelImplCopyWithImpl<_$GitHubRepoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepoModelImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepoModel implements GitHubRepModel {
  const factory _GitHubRepoModel(
      {required final int id,
      required final String name,
      final bool isFavorite}) = _$GitHubRepoModelImpl;

  factory _GitHubRepoModel.fromJson(Map<String, dynamic> json) =
      _$GitHubRepoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$GitHubRepoModelImplCopyWith<_$GitHubRepoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
