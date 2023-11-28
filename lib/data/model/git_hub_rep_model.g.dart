// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_hub_rep_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubRepoModelImpl _$$GitHubRepoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GitHubRepoModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$GitHubRepoModelImplToJson(
        _$GitHubRepoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isFavorite': instance.isFavorite,
    };
