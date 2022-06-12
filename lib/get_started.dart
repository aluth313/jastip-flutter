import 'package:flutter/material.dart';
import 'package:jastip/home.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(children: [
          Center(child: Image.asset('images/jastip-splash.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Titipin Aja!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Gausah cape-cape, tinggal di Titipin Aja.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0C4886),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(width, 50)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
