

import 'package:get/get_connect/connect.dart';
import 'app_exception.dart';
import 'openweathermap_api_constants.dart';

/// assistant de d'API météo
/// passer l'url de l'API météo
/// 'https://api.openweathermap.org/data/2.5/forecast?lat=48.8534&lon=2.3488&appid=de48daa537c9f6b0175d27e854844ce0'
/// pour Paris

class OpenweathermapAPI extends GetConnect{

  OpenweathermapAPI();




  Future<dynamic> getData() async {

    var responseJson;

    final response = await get(OpenweathermapAPIConstants.baaseUrl);

    responseJson = _returnResponse(response);

    print("-----#response #--------->>>> $responseJson");

    return responseJson;
  }


  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;

        return responseJson;
      case 400:

        throw BadRequestException(response.body.toString());


      case 403:

        throw UnauthorisedException(response.body.toString());

      default:



        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}