import 'package:auto_route/auto_route.dart';
import 'package:search_project/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:search_project/presentation/favorite_screen/favorite_screen.dart';
import 'package:search_project/presentation/home_screen/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({required storage}) : _storage = storage;

  final ISecureStorage _storage;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          path: HomeScreen.path,
        ),
        AutoRoute(path: FavoriteScreen.path, page: FavoriteRoute.page),
      ];
}
