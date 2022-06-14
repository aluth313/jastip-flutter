import 'package:flutter/material.dart';
import 'package:jastip/models/store.dart';

class DetailPage extends StatefulWidget {
  final Store store;

  DetailPage({required this.store});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: height * 0.4,
                    width: double.infinity,
                    child: Image.asset(
                      'images/market.png',
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SafeArea(
                      child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.store.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
