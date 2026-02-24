import 'package:auto_route/auto_route.dart';
import 'package:coda/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
      page: HomeRoute.page,
      path: '/',
      children: [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 150),
          page: SearchRoute.page,
          path: 'search',
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 150),
          page: FavoriteRoute.page,
          path: 'favorite',
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: Duration(milliseconds: 150),
          page: SettingsRoute.page,
          path: 'settings',
        ),
      ],
    ),
  ];
}
