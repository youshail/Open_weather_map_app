



import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/repository/weather_repository_imp.dart';
import '../../../../domain/model/weather.dart';

class WeatherController extends GetxController{



  final WeatherRepositoryImp weatherRepository = WeatherRepositoryImp();

  /// Une instance Rx nullable de WeatherData. La valeur initiale est null
  Rxn<WeatherData> weatherData = Rxn();

  /// obtenir arguments["email"]
  String userEmail = Get.arguments["email"];
  String text ="BIENVENUE ";




  Future<WeatherData?> getTemperatureForParis() async {

      /// Nous attribuons la réponse de notre appel API à notre objet Rx.

    var weatherDto =await weatherRepository.getWeather();
    weatherData.value = WeatherData.from(weatherDto!);

    return weatherData.value;

  }

  String getDateWithFormat(String format,DateTime dt){   //"dd/MM/yyyy"

    var dateFormat = DateFormat(format);
    String updatedDt = dateFormat.format(dt);

    return updatedDt;

  }



  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {


  }

  @override
  void onInit()  {
    getTemperatureForParis();
    super.onInit();
  }
}