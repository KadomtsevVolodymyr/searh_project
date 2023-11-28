import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:search_project/domain/entities/result.dart';

abstract interface class IProjectRepository {
  Future<Result<List<GitHubRepModel>>> searchRep(String text);
  Future<void> saveRepo(GitHubRepModel repo);

  Future<List<GitHubRepModel>> getRepos();
  Future<void> deleteRepoById(int id);
  Future<void> saveHistory(GitHubRepModel repo);
  Future<List<GitHubRepModel>> getHistory();
}
