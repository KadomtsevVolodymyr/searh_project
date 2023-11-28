import 'dart:convert';
import 'package:search_project/data/datasource/local/local_storage/local_storage_interface.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements ILocalStorage {
  static const _key = 'github_repos';
  static const _keyHistory = 'github_repos_history';

  @override
  Future<void> saveRepos(GitHubRepModel repo) async {
    final prefs = await SharedPreferences.getInstance();
    final List<GitHubRepModel> existingRepos = await getRepos();
    existingRepos.add(repo);
    final jsonString = jsonEncode(existingRepos);
    await prefs.setString(_key, jsonString);
  }

  @override
  Future<List<GitHubRepModel>> getRepos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => GitHubRepModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<void> deleteRepoById(int id) async {
    print(id);
    final prefs = await SharedPreferences.getInstance();
    final List<GitHubRepModel> existingRepos = await getRepos();
    existingRepos.removeWhere((repo) => repo.id == id);
    print(existingRepos);
    final jsonString = jsonEncode(existingRepos);
    await prefs.setString(_key, jsonString);
  }

  @override
  Future<List<GitHubRepModel>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyHistory);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => GitHubRepModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<void> saveHistory(GitHubRepModel repo) async {
    final prefs = await SharedPreferences.getInstance();
    final List<GitHubRepModel> existingRepos = await getHistory();
    existingRepos.add(repo);
    final jsonString = jsonEncode(existingRepos);
    await prefs.setString(_keyHistory, jsonString);
  }
}
