import 'package:search_project/data/model/git_hub_rep_model.dart';

abstract class ILocalStorage {
  Future<void> saveRepos(GitHubRepModel repos);
  Future<List<GitHubRepModel>> getRepos();
  Future<void> deleteRepoById(int id);
  Future<List<GitHubRepModel>> getHistory();
  Future<void> saveHistory(GitHubRepModel repo);
}
