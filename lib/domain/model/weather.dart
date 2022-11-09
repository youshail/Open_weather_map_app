
import '../../data/remote/dto/weather_dto.dart';


/// Classe de modèle  utilisée dans l'interface utilisateur

class WeatherData {
  WeatherData({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,

  });

  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;



  factory WeatherData.from(WeatherDto weatherDto) {
    return WeatherData(
      cod: weatherDto.cod,
      message: weatherDto.message,
      cnt: weatherDto.cnt,
      list: weatherDto.list,
    );
  }


}



