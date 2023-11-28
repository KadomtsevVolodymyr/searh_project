import 'package:search_project/data/datasource/network/api/github/github_api_interface.dart';
import 'package:search_project/data/datasource/network/exchange_models/request.dart';
import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';

class GitHubApi implements IGitHubApi {
  GitHubApi(INetworkService networkService) : _networkService = networkService;

  final INetworkService _networkService;

  static const String _searchPath = '/search';
  static const String _repositoriesPath = '$_searchPath/repositories';

  @override
  Future<NetworkResponse<List<GitHubRepModel>>> searchRep(String name) async =>
      await _networkService.request(
        NetworkRequest(
          queryParams: {"q": "{$name}", 'per_page': '15'},
          method: NetworkRequestType.get,
          path: _repositoriesPath,
        ),
        onParse: (response) {
          final List<dynamic> items = response.data['items'];
          final List<GitHubRepModel> repositories = items
              .map((dynamic item) => GitHubRepModel.fromJson(item))
              .toList();
          return repositories;
        },
      );
}
