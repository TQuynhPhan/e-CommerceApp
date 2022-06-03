import 'package:flutter/material.dart';
import '../components/product_cart.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text("Cart"),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),

      body: ProductCart(),

      bottomNavigationBar: Row(
        children: [
          Expanded( //listtile ở đây phải dùng expanded, k dùng lỗi
            child: ListTile(
              title: Text("Total"),
              subtitle: Text("\$"),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Check out",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
