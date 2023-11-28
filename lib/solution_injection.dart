import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:search_project/configs/app_config.dart';
import 'package:search_project/configs/environment/environment_helper.dart';
import 'package:search_project/configs/environment/environment_service.dart';
import 'package:search_project/configs/environment/environment_variables.dart';
import 'package:search_project/core/use_case.dart';
import 'package:search_project/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:search_project/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:search_project/data/datasource/local/local_storage/local_storage.dart';
import 'package:search_project/data/datasource/local/local_storage/local_storage_interface.dart';
import 'package:search_project/data/datasource/local/secure_storage.dart';
import 'package:search_project/data/datasource/network/api/breeds/breeds_api_interface.dart';
import 'package:search_project/data/datasource/network/api/breeds/breeds_api.dart';
import 'package:search_project/data/datasource/network/api/github/github_api_interface.dart';
import 'package:search_project/data/datasource/network/interceptors/token_interceptor.dart';
import 'package:search_project/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:search_project/data/datasource/network/api/authentication/authentication_api.dart';
import 'package:search_project/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:search_project/data/datasource/network/services/network_service/network_service.dart';
import 'package:search_project/data/repositories/auth_repository.dart';
import 'package:search_project/data/repositories/project_repository.dart';
import 'package:search_project/data/repositories/solution_repository.dart';
import 'package:search_project/domain/repository/auth_repository_interface.dart';
import 'package:search_project/domain/repository/project_repository_interface.dart';
import 'package:search_project/domain/repository/solution_repository_interface.dart';
import 'package:search_project/domain/use_cases/breeds_use_case.dart';
import 'package:search_project/utils/hive_helper.dart';
import 'package:search_project/data/datasource/local/solution_storage.dart';
import 'package:search_project/data/datasource/network/api/github/github_api.dart';

class SolutionInjection {
  static List<SingleChildWidget> getDiList(
    BuildContext context,
  ) {
    final SolutionInjection injection = SolutionInjection();
    return injection.diFactory(
      context,
    );
  }

  List<SingleChildWidget> diFactory(
    BuildContext context,
  ) {
    return [
      ..._buildIndependentServices(),
      ..._dependentServices(context),
    ];
  }

  List<SingleChildWidget> _buildIndependentServices() {
    return [
      Provider.value(value: AppConfig()),
      Provider.value(value: HiveHelper()),
      Provider.value(value: const FlutterSecureStorage()),
    ];
  }

  List<SingleChildWidget> _dependentServices(BuildContext context) {
    return [
      ProxyProvider<AppConfig, EnvironmentHelper>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper? greetingService,
        ) =>
            EnvironmentHelper(
          appConfig: appConfig,
          environmentValue: EnvironmentVariables.environmentValue,
          mockValue: EnvironmentVariables.mockValue,
        ),
      ),

      ProxyProvider2<AppConfig, EnvironmentHelper, EnvironmentService>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper envHelper,
          EnvironmentService? greetingService,
        ) =>
            EnvironmentService(
          environment: envHelper.currentEnvironment(),
          appConfig: appConfig,
        ),
      ),

      ProxyProvider<FlutterSecureStorage, ISecureStorage>(
        update: (
          BuildContext context,
          FlutterSecureStorage flutterSecureStorage,
          ISecureStorage? secureStorage,
        ) =>
            SecureStorage(secureStorage: flutterSecureStorage),
      ),

      ProxyProvider2<EnvironmentService, HiveHelper, ISolutionStorage>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          HiveHelper hiveHelper,
          ISolutionStorage? configurationStore,
        ) {
          final HiveInterface hive = Hive;
          return SolutionStorage(
            hive: hive,
            boxPrefix: environmentService.config.hiveBoxPrefix,
            hiveHelper: hiveHelper,
          );
        },
      ),

      ProxyProvider<AppConfig, EnvironmentHelper>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper? greetingService,
        ) =>
            EnvironmentHelper(
          appConfig: appConfig,
          environmentValue: EnvironmentVariables.environmentValue,
          mockValue: EnvironmentVariables.mockValue,
        ),
      ),

      ProxyProvider2<EnvironmentService, ISecureStorage, INetworkService>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          ISecureStorage authStore,
          INetworkService? networkService,
        ) {
          final interceptors = [
            LogInterceptor(),
            TokenInterceptor(authStore: authStore),
          ];
          return NetworkService(
            baseUrl: environmentService.config.portalUrl,
            interceptors: interceptors,
          );
        },
      ),

      //Domain services
      ProxyProvider<INetworkService, IAuthenticationApi>(
        update: (
          BuildContext context,
          INetworkService networkService,
          IAuthenticationApi? authService,
        ) {
          final firebaseAuth = FirebaseAuth.instance;
          return AuthenticationApi(firebaseAuth: firebaseAuth);
        },
      ),
      ProxyProvider2<IAuthenticationApi, ISecureStorage, IAuthRepository>(
        update: (
          BuildContext context,
          IAuthenticationApi authService,
          ISecureStorage secureStorage,
          IAuthRepository? facade,
        ) {
          return AuthRepository(
            authService: authService,
            secureStorage: secureStorage,
          );
        },
      ),

      ProxyProvider<INetworkService, IBreedsApi>(
        update: (
          BuildContext context,
          INetworkService networkService,
          IBreedsApi? breedsApi,
        ) =>
            BreedsApi(networkService),
      ),
      ProxyProvider2<INetworkService, EnvironmentHelper, IGitHubApi>(
        update: (
          BuildContext context,
          INetworkService networkService,
          EnvironmentHelper environmentHelper,
          IGitHubApi? establishmentsApi,
        ) =>
            GitHubApi(networkService),
      ),
      ProxyProvider<IGitHubApi, ILocalStorage>(
        update: (
          BuildContext context,
          IGitHubApi gitHubApi,
          ILocalStorage? localStorage,
        ) {
          return LocalStorage();
        },
      ),
      ProxyProvider2<IGitHubApi, ILocalStorage, IProjectRepository>(
        update: (
          BuildContext context,
          IGitHubApi gitHubApi,
          ILocalStorage localStorage,
          IProjectRepository? projectRE,
        ) {
          return ProjectRepository(
            api: gitHubApi,
            localStorage: localStorage,
          );
        },
      ),
      ProxyProvider2<IBreedsApi, ISolutionStorage, ISolutionRepository>(
        update: (
          BuildContext context,
          IBreedsApi breedsApi,
          ISolutionStorage storage,
          ISolutionRepository? breedsRepository,
        ) =>
            SolutionRepository(api: breedsApi, storage: storage),
      ),

      ProxyProvider<ISolutionRepository, BreedsUseCase>(
        update: (
          BuildContext context,
          ISolutionRepository breedsRepository,
          UseCase? breedsUseCase,
        ) =>
            BreedsUseCase(breedsRepository),
      ),
    ];
  }
}
