import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/presentation/modules/weather/weather_ui/widgets/weather_icon.dart';

import '../../../../../theme/app_colors.dart';




class DailyWeatherBox extends StatefulWidget {


  String date;
  String urlIcon;
  String temp;
  DailyWeatherBox({required this.date,required this.urlIcon,required this.temp});

  @override
  _AnimatedListItemweatherState createState() =>
      _AnimatedListItemweatherState();
}

class _AnimatedListItemweatherState extends State<DailyWeatherBox>
    with AutomaticKeepAliveClientMixin {
  bool _lock = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
      setState(() {
        _lock = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
        duration: const Duration(milliseconds: 1300),
        opacity: _lock ? 1 : 0,
        curve: Curves.easeInOutQuart,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 700),
          curve: Curves.ease,
          padding: _lock
              ? EdgeInsets.zero
              : EdgeInsets.only(top: MediaQuery.of(context).size.height),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.date,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: AppColors.quaternaryTxtColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),),
                const SizedBox(height: 8),
                WeatherIcon(iconUrl: widget.urlIcon, size: 48),
                const SizedBox(height: 8),
                Text(
                  widget.temp+"°",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: AppColors.primaryTxtColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),),
              ],
            ),
          ),
        ));
  }
}
