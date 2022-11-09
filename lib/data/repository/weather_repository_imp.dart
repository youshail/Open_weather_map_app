


import 'dart:convert';
import '../../domain/repository/weather_repository.dart';
import '../remote/dto/weather_dto.dart';
import '../remote/openweathermap_api.dart';

class WeatherRepositoryImp extends WeatherRepository{

  /// classe personnalisée définissant tous les détails de l'API

  final OpenweathermapAPI _api = OpenweathermapAPI();

  /// implémente la méthode dans la classe abstraite

  @override
  Future<WeatherDto?> getWeather() async {

    _api.timeout = const Duration(minutes: 3);
    _api.allowAutoSignedCert=true;

    var response = await _api.getData();

    var objectsJson = json.encode(response);

    var weatherDto = weatherDtoFromJson(objectsJson);


    return weatherDto;

  }


}