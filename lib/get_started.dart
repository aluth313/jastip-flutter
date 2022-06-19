import 'package:flutter/material.dart';
import 'package:jastip/home.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return GetStartedWeb();
          } else {
            return GetStartedMobile();
          }
        },
      ),
    );
  }
}

class GetStartedMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
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
                  // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Home(),
                  //     ));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        )
      ]),
    );
  }
}

class GetStartedWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      fixedSize: Size(400, 70)),
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Home(),
                    //     ));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ))
            ],
          )),
          Container(
            child: Image.asset('images/jastip-splash.png'),
          )
        ],
      ),
    );
  }
}
