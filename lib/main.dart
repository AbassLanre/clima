import 'package:clima/ui/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Clima",
    home: LoadingScreen(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));

}
