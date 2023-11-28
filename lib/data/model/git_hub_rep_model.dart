import 'package:freezed_annotation/freezed_annotation.dart';

part 'git_hub_rep_model.freezed.dart';
part 'git_hub_rep_model.g.dart';

@freezed
class GitHubRepModel with _$GitHubRepModel {
  const factory GitHubRepModel({
    required int id,
    required String name,
    @Default(false) bool isFavorite,
  }) = _GitHubRepoModel;

  factory GitHubRepModel.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepModelFromJson(json);
}
