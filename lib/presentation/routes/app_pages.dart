

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/authentification/authentification_state_management/authentification_binding.dart';
import '../modules/authentification/authentification_ui/authentification_page.dart';
import '../modules/weather/weather_state_management/weather_binding.dart';
import '../modules/weather/weather_ui/pages/main_page.dart';
part 'app_routes.dart';

class AppPages {

  static const INITIAL = Routes.MAIN_PAGE;

  static final routes = [

    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => AuthentificationPage(),
      binding: AuthentificationBinding(),
    ),

    GetPage(
      name: Routes.WEATHER_PAGE,
      page: () => WeatherMainPage(),
      binding: WeatherBinding(),
    ),




  ];
}