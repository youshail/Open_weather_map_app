

import 'package:get/get.dart';
import 'package:nouvelle_collab_exercice/presentation/modules/weather/weather_state_management/weather_controller.dart';

class WeatherBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<WeatherController>(WeatherController());
  }


}