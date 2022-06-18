import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Daftar Toko'),
          ),
          
        ],
      ),
    );
  }
}