import 'package:flutter/material.dart';
import 'package:jastip/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // primarySwatch: Colors.blue,
      ),
      home: GetStarted(),
    );
  }
}
