

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import '../../../../../domain/model/weather.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../weather_state_management/weather_controller.dart';
import '../widgets/current_weather_box.dart';
import '../widgets/daily_weather_box.dart';
import 'package:open_weather_app/presentation/modules/weather/weather_ui/pages/weather_page.dart';
import 'package:open_weather_app/presentation/modules/weather/weather_ui/pages/additional_information _page.dart';


class WeatherMainPage extends GetView<WeatherController> {


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        WillPopScope(
          onWillPop: () async {
            Get.offNamed(Routes.MAIN_PAGE);

            return false;
          },
          child: Scaffold(

            key: scaffoldKey,
            backgroundColor: Colors.white,

            appBar: AppBar(
              title: Center(child: Text(
                  controller.text + controller.userEmail.substring(0,controller.userEmail.indexOf("@")).toUpperCase())),
            ),


            body: getDashBoardMainBodyContainer(controller.index.value),
            bottomNavigationBar: FloatingNavbar(
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.blueAccent,
              onTap: (int val) => controller.index.value = val,
              currentIndex: controller.index.value,
              items: [
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(icon: Icons.explore, title: 'Information'),

              ],
            ),


          ),
        ));
  }

  getDashBoardMainBodyContainer(int selectedIndex){


    if(selectedIndex == 0){
      return WeatherPage();
    }

    else if(selectedIndex == 1){
       return AdditionalInformation();
    }
    else if(selectedIndex == 2){

      Get.offNamed(Routes.MAIN_PAGE);

    }



  }
}


