import 'package:flutter/material.dart';
import 'package:jastip/get_started.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: GetStarted(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
