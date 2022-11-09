

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/model/weather.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../weather_state_management/weather_controller.dart';
import '../widgets/current_weather_box.dart';
import '../widgets/daily_weather_box.dart';



class WeatherMainPage extends GetView<WeatherController>{


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {


        Get.offNamed(Routes.MAIN_PAGE);



        return false;
      },
      child: Scaffold(

          key: scaffoldKey,
          backgroundColor: Colors.white,

          appBar: AppBar(
            title: Center(child:  Text(controller.text+controller.userEmail.toUpperCase())),
          ),


          body: ListView(
                children: [

                  FutureBuilder<WeatherData?>(
                    initialData: controller.weatherData.value,
                    future: controller.getTemperatureForParis(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> contentItems = [];

                        contentItems.add(

                            CurrentWeatherBox(
                                date:controller.getDateWithFormat("EEE, MMM d, yy  h:mm a",controller.weatherData.value!.list!.first.dtTxt!),
                                urlIcon: controller.weatherData.value!.list!.first.weather!.first.icon??"",
                                temp: controller.weatherData.value!.list!.first.main!.temp!.toInt().toString(),
                                description: controller.weatherData.value!.list!.first.weather!.first.description??"",
                                main: controller.weatherData.value!.list!.first.weather!.first.main??"",
                            )
                        );

                        // API returns data points in 3-hour intervals -> 1 day = 8 intervals
                        final items = [0, 8, 16, 24, 32];


                        for(var i in items){
                          contentItems.add(
                              DailyWeatherBox(
                                  date:DateFormat.E().format(snapshot.requireData!.list![i].dtTxt!),
                                  urlIcon: snapshot.requireData!.list![i].weather!.first.icon??"",
                                  temp: snapshot.requireData!.list![i].main!.temp!.toInt().toString())
                          );
                        }

                        return snapshot.requireData!.list!.isEmpty ?
                        Container(
                          height: 70,
                          child: Center(
                            child: Text(
                              "Une erreur s'est produite, veuillez réessayer plus tard.",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: AppColors.errorColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10)),
                            ),
                          ),
                        )
                            : Wrap(
                            alignment: WrapAlignment.center,
                            children: contentItems,
                          );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Une erreur s'est produite, veuillez réessayer plus tard.",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: AppColors.errorColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11)),
                          ),
                        );
                      }
                      return  const Center(
                          child: CircularProgressIndicator());
                    },
                  )
                ],
              )


      ),
    );

  }



}