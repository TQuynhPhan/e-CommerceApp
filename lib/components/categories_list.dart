import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(img: "images/carousel1.png", name: "shirt"),
          Category(img: "images/carousel2.png", name: "dress"),
          Category(img: "images/carousel2.png", name: "pants"),
          Category(img: "images/carousel2.png", name: "formal"),
          Category(img: "images/carousel2.png", name: "informal"),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String img;
  final String name;

  Category({required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              img,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(name),
            ),
          ),
        ),
      ),
    );
  }
}
