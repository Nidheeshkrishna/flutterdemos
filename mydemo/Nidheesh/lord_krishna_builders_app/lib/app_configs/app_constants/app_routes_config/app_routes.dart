import 'package:flutter/material.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_route_names.dart';
import 'package:lord_krishna_builders_app/app_modules/company_selection_module/Views/pages/company_selection_page.dart';
import 'package:lord_krishna_builders_app/app_modules/home_module/views/Pages/home_page.dart';
import 'package:lord_krishna_builders_app/app_modules/task_details_page.dart/views/task_details_page.dart';
import 'package:lord_krishna_builders_app/main.dart';

import '../../../app_modules/login_module/views/Pages/login_page.dart';

class RouteEngine {
  static Object? args;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    args = settings.arguments;
    switch (settings.name) {
      case '/mainHome':
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/mainHome"),
          maintainState: true,
          builder: (_) => const MyHomePage(
            title: '',
          ),
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppRoutes.loginPage),
          maintainState: true,
          builder: (_) => const LoginPage(),
        );

      case AppRoutes.companySelectionPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppRoutes.companySelectionPage),
          maintainState: true,
          builder: (_) => const CompanyselectionPage(),
        );

      case AppRoutes.homePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppRoutes.homePage),
          maintainState: true,
          builder: (_) => const HomePage(),
        );
      default:
        return null;
    }
  }
}
