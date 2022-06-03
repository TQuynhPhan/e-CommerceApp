// @dart=2.9

import 'package:commercial_app/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../components/categories_list.dart';
import '../components/product.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/carousel1.png'),
          AssetImage('images/carousel2.png'),
          AssetImage('images/carousel3.png'),
          AssetImage('images/carousel4.png'),
          AssetImage('images/carousel5.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 3.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text("Shopping"),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("abc"),
              accountEmail: Text("abc@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Account"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Order"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text("Cart"),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          carousel,
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Categories",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          CategoriesList(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: Text("Recent products",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Product(),
        ],
      ),
    );
  }
}
