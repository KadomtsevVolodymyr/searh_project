import 'package:search_project/data/datasource/local/local_storage/local_storage_interface.dart';
import 'package:search_project/data/datasource/network/api/github/github_api_interface.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:search_project/domain/entities/result.dart';
import 'package:search_project/domain/repository/project_repository_interface.dart';

class ProjectRepository implements IProjectRepository {
  ProjectRepository(
      {required IGitHubApi api, required ILocalStorage localStorage})
      : _api = api,
        _localStorage = localStorage;

  final ILocalStorage _localStorage;
  final IGitHubApi _api;
  @override
  Future<Result<List<GitHubRepModel>>> searchRep(String text) async {
    final response = await _api.searchRep(text);
    return response.when(
      onSuccess: Result<List<GitHubRepModel>>.success,
      onError: Result.error,
    );
  }

  @override
  Future<void> saveRepo(GitHubRepModel repo) async {
    await _localStorage.saveRepos(repo);
  }

  @override
  Future<List<GitHubRepModel>> getRepos() async {
    return await _localStorage.getRepos();
  }

  @override
  Future<void> deleteRepoById(int id) async {
    await _localStorage.deleteRepoById(id);
  }

  @override
  Future<List<GitHubRepModel>> getHistory() async {
    return await _localStorage.getHistory();
  }

  @override
  Future<void> saveHistory(GitHubRepModel repo) async {
    await _localStorage.saveHistory(repo);
  }
}
