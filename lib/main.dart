import 'package:clima/ui/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Clima",
    home: LocationScreen(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));

}
