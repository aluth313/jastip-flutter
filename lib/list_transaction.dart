import 'package:flutter/material.dart';
import 'package:jastip/order.dart';
import 'package:intl/intl.dart' as intl;

class ListTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text('My Transactions'),
        backgroundColor: Color(0xFFBFE8F9),
      ),
      body: myCheckout.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width * 0.5,
                      child: Image.asset('images/cart.png')),
                  SizedBox(
                    height: 10,
                  ),
                  Text('No Transaction Yet')
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var data = myCheckout[index]['data'];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.receipt_long_outlined,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Pesanan')
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.orange,
                                ),
                                child: Text('Proses'),
                              )
                            ],
                          ),
                          Divider(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, indexData) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
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
                                        data[indexData]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[indexData]['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            'Quantity : ${data[indexData]['quantity'].toString()}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: data.length,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Harga'),
                              Text(
                                  'Rp. ${intl.NumberFormat.decimalPattern().format(myCheckout[index]['total']).toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                  // order.png
                },
                itemCount: myCheckout.length,
              ),
            ),
    );
  }
}
