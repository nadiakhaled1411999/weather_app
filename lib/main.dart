import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        //!
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  String formattedCondition =  condition.trim().toLowerCase(); // تصحيح الفرق في الأحرف والمسافات


  switch (formattedCondition) {
    case 'sunny':
    case 'clear':
      return Colors.amber;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'fog':
    case 'freezing fog':
    case 'mist':
      return Colors.purple;

    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.brown;

    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.pink;

    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.indigo;

    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'blowing snow':
    case 'blizzard':
    case 'ice pellets':
      return Colors.blueGrey;

    default:
      return Colors.blue; // قيمة افتراضية
  }
}
