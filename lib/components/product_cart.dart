import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  var productCart = [
    {
      "name": "Blazer",
      "picture": "images/carousel1.png",
      "price": 100,
      "size": "M",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Dress",
      "picture": "images/carousel2.png",
      "price": 120,
      "size": "L",
      "color": "Blue",
      "quantity": 2
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productCart.length,
      itemBuilder: (context, index) {
        return ProductItemCart(
            name: productCart[index]["name"],
            picture: productCart[index]["picture"],
            price: productCart[index]["price"],
            size: productCart[index]["size"],
            color: productCart[index]["color"],
            quantity: productCart[index]["quantity"]);
      },
    );
  }
}

class ProductItemCart extends StatelessWidget {
  final name;
  final picture;
  final price;
  final size;
  final color;
  final quantity;

  ProductItemCart(
      {required this.name,
      required this.picture,
      required this.price,
      required this.size,
      required this.color,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: ListTile(
        leading: Image.asset(picture),
        title: Row(
          children: [
            Text(name),
            SizedBox(width: 40.0,),
            Text('\$$price')
          ],
        ),
        subtitle: Row(
          children: [
            Text("Size:"),
            SizedBox(
              width: 3.0,
            ),
            Text(size),

            SizedBox(width: 35.0,),

            Text("Color:"),
            SizedBox(
              width: 3.0,
            ),
            Text(color),

            SizedBox(width: 35.0,),

            // Text("Quantity:"),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_up)),
                Text('$quantity'),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
