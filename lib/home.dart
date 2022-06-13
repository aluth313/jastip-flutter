import 'package:flutter/material.dart';
import 'package:jastip/models/store.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Kamu',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Selamat Datang!')
                      ],
                    ),
                    Container(
                        width: 60, child: Image.asset('images/avatar.png'))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Toko di dekatmu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: storeNearbyList.map((data) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 3.0,
                            child: Container(
                                width: 120, child: Image.asset(data.image!)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.name!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8,
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
                              Text(data.rate!)
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Toko Terpopuler',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: popularStoreList.map((data) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 3.0,
                            child: Container(
                                width: 120, child: Image.asset(data.image!)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.name!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8,
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
                              Text(data.rate!)
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mungkin Anda Suka',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: allStoreList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      child: Image.asset(
                                          allStoreList[index].image!),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    allStoreList[index].name!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                        overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(
                                                  allStoreList[index].category!,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                
                                              ],
                                            ),
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
                                                  Text(allStoreList[index].rate!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                  ),)
                                                ],
                                              ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                    //   InkWell(
                    //   onTap: () {},
                    //   child: Expanded(
                    //     child: Row(
                    //       children: [
                    //         Card(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 width: width * 0.5,
                    //                 child: Image.asset(allStoreList[index].image!),
                    //               ),
                    //               Expanded(
                    //                   child: Column(
                    //                 children: [
                    //                   Text(
                    //                     allStoreList[index].name!,
                    //                     style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                   ),
                    //                   // Row(
                    //                   //   children: [
                    //                   //     Icon(
                    //                   //       Icons.star_outlined,
                    //                   //       color: Colors.yellow,
                    //                   //     ),
                    //                   //     SizedBox(
                    //                   //       width: 5,
                    //                   //     ),
                    //                   //     Text(allStoreList[index].rate!)
                    //                   //   ],
                    //                   // )
                    //                   // Row(
                    //                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   //   children: [
                    //                   //     Container(
                    //                   //       decoration: BoxDecoration(
                    //                   //         color: Colors.grey
                    //                   //       ),
                    //                   //       child: Row(
                    //                   //         children: [
                    //                   //           InkWell(
                    //                   //             onTap: () {

                    //                   //             },
                    //                   //             child: Text('-'),
                    //                   //           ),
                    //                   //           SizedBox(width: 5,),
                    //                   //           Text('0'),
                    //                   //           SizedBox(width: 5,),
                    //                   //           InkWell(
                    //                   //             onTap: () {

                    //                   //             },
                    //                   //             child: Text('+'),
                    //                   //           ),
                    //                   //         ],
                    //                   //       ),
                    //                   //     ),
                    //                   //     Text(allStoreList[index].rate)
                    //                   //   ],
                    //                   // )
                    //                 ],
                    //               ))
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
