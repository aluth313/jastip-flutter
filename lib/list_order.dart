import 'package:flutter/material.dart';
import 'package:jastip/detail.dart';
import 'package:jastip/models/store.dart';

class ListOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
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
                            // crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
