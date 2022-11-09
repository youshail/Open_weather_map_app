



import '../../data/remote/dto/weather_dto.dart';

abstract class WeatherRepository{

  /// classe abstraite qui définit l'interface de notre Repository

  Future<WeatherDto?> getWeather();

}