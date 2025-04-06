import 'package:flutter/material.dart';

class  NoWeatherBody extends StatelessWidget {
  const  NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          "there is no weather😔 start \n searching now🔍",
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      );
  }
}