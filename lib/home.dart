import 'package:flutter/material.dart';
import 'package:jastip/detail.dart';
import 'package:jastip/list_store.dart';
import 'package:jastip/list_transaction.dart';
import 'package:jastip/models/store.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return HomeWeb(
              gridCount: 5,
            );
          } else {
            return HomeMobile();
          }
        },
      ),
    );
  }
}

class HomeWeb extends StatelessWidget {
  final int gridCount;

  HomeWeb({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
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
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'My Order List',
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTransaction(),
                            )),
                        icon: Icon(
                          Icons.receipt_long_outlined,
                        ),
                      ),
                      Container(
                          width: 60, child: Image.asset('images/avatar.png')),
                    ],
                  )
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListStore(),
                      )),
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
            GridView.count(
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: gridCount,
              children: storeNearbyList.map((data) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(store: data),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 3.0,
                            child: Container(child: Image.asset(data.image!)),
                          ),
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
                  ),
                );
              }).toList(),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListStore(),
                      )),
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
            GridView.count(
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: gridCount,
              children: popularStoreList.map((data) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(store: data),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 3.0,
                            child: Container(child: Image.asset(data.image!)),
                          ),
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
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mungkin Anda Suka',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: gridCount,
              children: allStoreList.map((data) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(store: data),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 3.0,
                            child: Container(child: Image.asset(data.image!)),
                          ),
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
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
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
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'My Order List',
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTransaction(),
                            )),
                        icon: Icon(
                          Icons.receipt_long_outlined,
                        ),
                      ),
                      Container(
                          width: 60, child: Image.asset('images/avatar.png')),
                    ],
                  )
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListStore(),
                      )),
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
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(store: data),
                        )),
                    child: Container(
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListStore(),
                      )),
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
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(store: data),
                        )),
                    child: Container(
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
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(store: allStoreList[index]),
                        )),
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
                                    child:
                                        Image.asset(allStoreList[index].image!),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
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
                                            Text(
                                              allStoreList[index].rate!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
