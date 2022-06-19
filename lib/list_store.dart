import 'package:flutter/material.dart';
import 'package:jastip/detail.dart';
import 'package:jastip/models/store.dart';

class ListStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return ListStoreWeb(
              gridCount: 5,
            );
          } else {
            return ListStoreMobile();
          }
        },
      ),
    );
  }
}

class ListStoreWeb extends StatelessWidget {
  final int gridCount;

  ListStoreWeb({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Daftar Toko', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),),
              ),
              SizedBox(height: 10,),
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
      ),
    );
  }
}

class ListStoreMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFFBFE8F9),
          pinned: true,
          expandedHeight: height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Daftar Toko',
              style: TextStyle(color: Colors.black),
            ),
            background: Image.asset(
              'images/market_header.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
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
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Image.asset(allStoreList[index].image!),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
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
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          allStoreList[index].category!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
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
            ),
          );
        }, childCount: allStoreList.length))
      ],
    );
  }
}
