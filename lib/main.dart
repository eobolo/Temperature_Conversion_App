import 'package:flutter/material.dart';
import 'package:temperature_conversion_app/home/conversion_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TemperatureConversionApp()
    );
  }
}