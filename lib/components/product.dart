import 'package:flutter/material.dart';
import '../screens/product_detail.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {"name": "Blazer", "picture": "images/carousel1.png", "price": 100},
    {"name": "Dress", "picture": "images/carousel2.png", "price": 120},
    {"name": "Blazer", "picture": "images/carousel1.png", "price": 100},
    {"name": "Dress", "picture": "images/carousel2.png", "price": 120}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //nhớ phải nằm trong container và có height, nếu k sẽ lỗi
      height: 300.0,
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
              name: productList[index]["name"],
              picture: productList[index]["picture"],
              price: productList[index]["price"]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final name;
  final picture;
  final price;

  ProductItem({required this.name, required this.picture, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProductDetail(name: name, picture: picture, price: price,))),
            child: GridTile(
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
              footer: Container(
                height: 50.0,
                color: Colors.white,
                child: ListTile(
                  leading: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                  title: Text(
                    '\$$price',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
