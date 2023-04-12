
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/information_box.dart';
import '../../weather_state_management/weather_controller.dart';

class AdditionalInformation  extends GetView<WeatherController>{

  const AdditionalInformation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
       child: InformationBox(
         cityCoord: controller.weatherData.value!.city!.coord!.lat.toString(),
         cityName: controller.weatherData.value!.city!.name??"",
       ),
    );

  }
}

