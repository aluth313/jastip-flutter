import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jastip/list_transaction.dart';
import 'package:jastip/models/store.dart';
import 'package:intl/intl.dart' as intl;
import 'package:jastip/order.dart';

class DetailPage extends StatelessWidget {
  final Store store;

  DetailPage({required this.store});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DetailPageWeb(store: store);
        } else {
          return DetailPageMobile(
            store: store,
          );
        }
      },
    );
  }
}

class DetailPageWeb extends StatefulWidget {
  final Store store;

  DetailPageWeb({required this.store});

  @override
  State<DetailPageWeb> createState() => _DetailPageWebState();
}

class _DetailPageWebState extends State<DetailPageWeb> {
  var myQuantityOrder = [];
  var quantity = 0;
  var total = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var menus = widget.store.menus;

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            'images/market.png',
                            height: height * 0.5,
                            fit: BoxFit.contain,
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.store.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.store.category!,
                            style: TextStyle(
                              // color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_outlined,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.store.rate!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.count(
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: List.generate(menus.length, (index) {
                      myQuantityOrder.add(0);
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  // width: width * 0.2,
                                  // height: height * 0.1,
                                  padding: EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFFEAEAED),
                                  ),
                                  child: Image.asset(
                                    menus[index]['image_menu'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  menus[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Rp. ${intl.NumberFormat.decimalPattern().format(menus[index]['price']).toString()}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6F5F8),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (myQuantityOrder[index] > 0) {
                                                myQuantityOrder[index]--;
                                                total -= menus[index]['price']
                                                    as int;
                                                for (var data in myOrderList) {
                                                  if (data['name'] ==
                                                      menus[index]['name']) {
                                                    myOrderList.remove(data);
                                                    break;
                                                  }
                                                }
                                                print(myQuantityOrder[index]);
                                                print('myOrderList');
                                                print(myOrderList);
                                              }
                                            });
                                          },
                                          child: Icon(Icons.remove_outlined),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          myQuantityOrder[index].toString(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              myQuantityOrder[index]++;
                                              total +=
                                                  menus[index]['price'] as int;
                                              myOrderList.add({
                                                'name': menus[index]['name'],
                                                'price': menus[index]['price'],
                                                'quantity': 1,
                                              });
                                              print(myQuantityOrder[index]);
                                              print(myOrderList);
                                            });
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          'Rp. ${intl.NumberFormat.decimalPattern().format(total).toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:
                            total == 0 ? Color(0xFFF8F7FC) : Color(0xFF0C4886),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(width, 50)),
                    onPressed: () async {
                      var checkoutData = [];
                      int total = 0;
                      for (var i = 0; i < myQuantityOrder.length; i++) {
                        if (myQuantityOrder[i] > 0) {
                          checkoutData.add({
                            'image': menus[i]['image_menu'],
                            'name': menus[i]['name'],
                            'price': menus[i]['price'],
                            'quantity': myQuantityOrder[i],
                          });
                          total +=
                              (menus[i]['price'] * myQuantityOrder[i]) as int;
                        }
                      }
                      myCheckout.add({
                        'total': total,
                        'data': checkoutData,
                      });
                      // myCheckout['data'] = checkoutData;
                      // myCheckout['total'] = total;
                      print('myCheckout');
                      print(myCheckout);
                      await EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
                      Future.delayed(
                        Duration(seconds: 2),
                        () async {
                          await EasyLoading.showSuccess(
                              'Pesanan Anda sudah masuk, mohon untuk menunggu');
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListTransaction(),
                              ),
                              (route) => route.isFirst);
                        },
                      );
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: total == 0 ? Color(0xFFAFADB7) : Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }
}

class DetailPageMobile extends StatefulWidget {
  final Store store;

  DetailPageMobile({required this.store});

  @override
  State<DetailPageMobile> createState() => _DetailPageMobileState();
}

class _DetailPageMobileState extends State<DetailPageMobile> {
  var myQuantityOrder = [];
  var quantity = 0;
  var total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.store.menus);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var menus = widget.store.menus;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.store.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        widget.store.category!,
                        style: TextStyle(
                          // color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.store.rate!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  myQuantityOrder.add(0);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.2,
                              height: height * 0.1,
                              padding: EdgeInsets.all(7.0),
                              // color: Color(0xFFEAEAED),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFEAEAED),
                              ),
                              child: Image.asset(
                                menus[index]['image_menu'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    menus[index]['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF6F5F8),
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (myQuantityOrder[index] >
                                                    0) {
                                                  myQuantityOrder[index]--;
                                                  total -= menus[index]['price']
                                                      as int;
                                                  for (var data
                                                      in myOrderList) {
                                                    if (data['name'] ==
                                                        menus[index]['name']) {
                                                      myOrderList.remove(data);
                                                      break;
                                                    }
                                                  }
                                                  print(myQuantityOrder[index]);
                                                  print('myOrderList');
                                                  print(myOrderList);
                                                }
                                              });
                                            },
                                            child: Icon(Icons.remove_outlined),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            myQuantityOrder[index].toString(),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                myQuantityOrder[index]++;
                                                total += menus[index]['price']
                                                    as int;
                                                myOrderList.add({
                                                  'name': menus[index]['name'],
                                                  'price': menus[index]
                                                      ['price'],
                                                  'quantity': 1,
                                                });
                                                print(myQuantityOrder[index]);
                                                print(myOrderList);
                                              });
                                            },
                                            child: Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Rp. ${intl.NumberFormat.decimalPattern().format(menus[index]['price']).toString()}',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        'Rp. ${intl.NumberFormat.decimalPattern().format(total).toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          total == 0 ? Color(0xFFF8F7FC) : Color(0xFF0C4886),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(width, 50)),
                  onPressed: () async {
                    var checkoutData = [];
                    int total = 0;
                    for (var i = 0; i < myQuantityOrder.length; i++) {
                      if (myQuantityOrder[i] > 0) {
                        checkoutData.add({
                          'image': menus[i]['image_menu'],
                          'name': menus[i]['name'],
                          'price': menus[i]['price'],
                          'quantity': myQuantityOrder[i],
                        });
                        total +=
                            (menus[i]['price'] * myQuantityOrder[i]) as int;
                      }
                    }
                    myCheckout.add({
                      'total': total,
                      'data': checkoutData,
                    });
                    // myCheckout['data'] = checkoutData;
                    // myCheckout['total'] = total;
                    print('myCheckout');
                    print(myCheckout);
                    await EasyLoading.show(
                      status: 'loading...',
                      maskType: EasyLoadingMaskType.black,
                    );
                    Future.delayed(
                      Duration(seconds: 2),
                      () async {
                        await EasyLoading.showSuccess(
                            'Pesanan Anda sudah masuk, mohon untuk menunggu');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTransaction(),
                            ),
                            (route) => route.isFirst);
                      },
                    );
                  },
                  child: Text(
                    'Order',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: total == 0 ? Color(0xFFAFADB7) : Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
