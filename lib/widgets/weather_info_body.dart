// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';



class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
decoration: BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topLeft,end: Alignment.bottomRight,
  colors: [
getThemeColor( weatherModel.weatherCondition),
getThemeColor( weatherModel.weatherCondition)[300]!,
getThemeColor( weatherModel.weatherCondition)[50]!,


],)
),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              " Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  "${weatherModel.temp.round()}",
                  style:
                      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "MaxTemp: ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "MinTemp: ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/*DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}*/
