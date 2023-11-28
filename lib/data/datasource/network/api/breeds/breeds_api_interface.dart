import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:search_project/data/model/breeds_model.dart';

abstract interface class IBreedsApi {
  IBreedsApi(INetworkService networkService);

  Future<NetworkResponse<BreedsModel>> getBreeds();
}
