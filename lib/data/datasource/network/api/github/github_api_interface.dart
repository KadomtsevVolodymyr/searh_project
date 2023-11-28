import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';

abstract interface class IGitHubApi {
  IGitHubApi(INetworkService networkService);

  Future<NetworkResponse<List<GitHubRepModel>>> searchRep(String name);
}
