import 'package:expense_manager/app/modules/home/views/settings_view.dart';
import 'package:get/get.dart';

import 'package:expense_manager/app/modules/Authentication/bindings/authentication_binding.dart';
import 'package:expense_manager/app/modules/Authentication/views/login_view.dart';
import 'package:expense_manager/app/modules/Authentication/views/register_view.dart';
import 'package:expense_manager/app/modules/home/bindings/home_binding.dart';
import 'package:expense_manager/app/modules/home/views/home_view.dart';
import 'package:expense_manager/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:expense_manager/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: HomeBinding(),
    ),
  ];
}
