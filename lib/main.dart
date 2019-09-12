import 'package:flutter/material.dart';
import 'package:ecommerce_app/presentation/bottom_navigation.dart';
import 'package:ecommerce_app/presentation/custom_icons.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/product.dart';
import 'dart:convert';
import 'package:ecommerce_app/presentation/products_grid.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFF573dc0),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Product> shoes;
  http.Response shoesResponse;
  List<Product> jackets;
  http.Response jacketsResponse;
  List<Product> bags;
  http.Response bagsResponse;

  TabController _tabController;

  void _fetchData() async {
    shoesResponse = await http.get("https://api.myjson.com/bins/8embx");
    jacketsResponse = await http.get("https://api.myjson.com/bins/9lhjh");
    bagsResponse = await http.get("https://api.myjson.com/bins/19wxfx");

    setState(() {
      Iterable tempData, tempData1, tempData2;
      tempData = json.decode(shoesResponse.body);
      shoes = tempData.map((item) => Product.fromJson(item)).toList();
      tempData1 = json.decode(jacketsResponse.body);
      jackets = tempData1.map((item) => Product.fromJson(item)).toList();
      tempData2 = json.decode(bagsResponse.body);
      bags = tempData2.map((item) => Product.fromJson(item)).toList();
    });
  }

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          color: Colors.white,
          child: DropdownButton(
            onChanged: (value) {},
            elevation: 0,
            underline: Container(),
            items: <DropdownMenuItem>[
              DropdownMenuItem(
                value: 0,
                child: Text(
                  "Popular",
                  style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Trend",
                  style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
              ),
            ],
            value: 0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Stack(
              children: <Widget>[
                Icon(
                  CustomIcons.bag,
                  size: 27,
                  color: Colors.grey[850],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.lightGreenAccent,
                      maxRadius: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.search,
                    size: 32,
                    color: Colors.grey[850],
                  )),
            ),
          ),
        ],
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          labelColor: Color(0xFF573dc0),
          indicatorWeight: 2,
          indicatorColor: Color(0xFF573dc0),
          unselectedLabelColor: Colors.grey[200],
          indicator: UnderlineTabIndicator(),
          tabs: <Widget>[
            Tab(
              child: Container(
                child: Text(
                  "Shoes",
                  style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 27),
                ),
              ),
            ),
            Tab(
              child: Text(
                "Jackets",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 27),
              ),
            ),
            Tab(
              child: Text(
                "Bags",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 27),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: shoes == null
          ? Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: <Widget>[
                ProductsGrid(products: shoes),
                ProductsGrid(products: jackets),
                ProductsGrid(products: bags),
              ],
            ),
    );
  }
}
