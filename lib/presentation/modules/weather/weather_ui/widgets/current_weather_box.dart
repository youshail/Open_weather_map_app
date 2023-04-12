

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/presentation/modules/weather/weather_ui/widgets/weather_icon.dart';

import '../../../../../theme/app_colors.dart';


class CurrentWeatherBox extends StatelessWidget{


  String date;
  String urlIcon;
  String temp;
  String description;
  String main;
  CurrentWeatherBox({required this.date,required this.urlIcon,required this.temp,required this.main,required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(16),
        height: 100,
        decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            // shadow
            spreadRadius: .5,
            // set effect of extending the shadow
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
      ),
        child: Row(
          children: [
            WeatherIcon(iconUrl: urlIcon, size: 48),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColors.quaternaryTxtColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "$temp°",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: AppColors.primaryTxtColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 14)),

                    ),
                  ),

                  Text(
                    "$main, $description",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColors.tertiaryTxtColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11)),
                  ),
                ],
              )
            ),
          ],
        ),
    );
  }



}