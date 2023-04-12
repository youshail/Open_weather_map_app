import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/presentation/modules/weather/weather_ui/widgets/weather_icon.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../../../../theme/app_colors.dart';

class InformationBox extends StatelessWidget {
  String cityName;
  String cityCoord;


  InformationBox(
      {required this.cityName,
      required this.cityCoord,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16),
      height: 100,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0,right: 3.0,bottom: 4.0),
                child: Container(
                  child: Icon(
                      Icons.location_city,
                      color : Colors.blueAccent
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  cityName,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: AppColors.quaternaryTxtColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0,right: 3.0,top: 4.0),
                child: Container(
                  child: Icon(
                    Icons.near_me,
                      color : Colors.blueAccent
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  cityCoord,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: AppColors.quaternaryTxtColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
