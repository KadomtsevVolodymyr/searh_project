import 'package:flutter/material.dart';
import 'package:search_project/domain/entities/breeds.dart';
import 'package:search_project/domain/entities/result.dart';

abstract interface class ISolutionRepository {
  Future<Result<Breeds>> fetchBreeds();

  Future<Result<void>> saveTheme(ThemeMode themeMode);

  Future<int?> getTheme();

  Future<Result<void>> saveLocale(String language);

  Future<String?> getLocale();
}
