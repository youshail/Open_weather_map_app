


import 'package:flutter/cupertino.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({Key? key, required this.iconUrl, required this.size})
      : super(key: key);
  final String iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: size,
      height: size,
      child: Image.network(iconUrl),
    );
  }
}