import 'package:flutter/material.dart';
import 'package:search_project/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:search_project/data/datasource/network/api/breeds/breeds_api_interface.dart';
import 'package:search_project/data/model/breeds_model.dart';
import 'package:search_project/domain/entities/breeds.dart';
import 'package:search_project/domain/entities/result.dart';
import 'package:search_project/domain/repository/solution_repository_interface.dart';

class SolutionRepository implements ISolutionRepository {
  SolutionRepository({
    required IBreedsApi api,
    required ISolutionStorage storage,
  })  : _api = api,
        _storage = storage;

  final IBreedsApi _api;

  final ISolutionStorage _storage;

  @override
  Future<Result<Breeds>> fetchBreeds() async {
    final result = await _api.getBreeds();
    return result.when(
      onSuccess: Result<BreedsModel>.success,
      onError: Result.error,
    );
  }

  @override
  Future<int?> getTheme() => _storage.getTheme();

  @override
  Future<Result<void>> saveTheme(ThemeMode themeMode) =>
      _storage.saveTheme(themeMode);

  @override
  Future<String?> getLocale() => _storage.getLocale();

  @override
  Future<Result<void>> saveLocale(String language) =>
      _storage.saveLocale(language);
}
