import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final name;
  final picture;
  final price;

  ProductDetail(
      {required this.name, required this.picture, required this.price});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text("Shopping"),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          height: 300.0,
          child: GridTile(
            child: Container(
              child: Image.asset(widget.picture),
            ),
            footer: Container(
              color: Colors.white,
              child: ListTile(
                leading: Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                title: Text(
                  '\$${widget.price}',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Size"),
                          content: Text("Choose size"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Size",
                      style: TextStyle(fontSize: 13.0),
                    )),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Color"),
                          content: Text("Choose color"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Color",
                      style: TextStyle(fontSize: 13.0),
                    )),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Quantity"),
                          content: Text("Choose quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Quantity",
                      style: TextStyle(fontSize: 13.0),
                    )),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                child: Text("Buy now"),
                color: Colors.blue,
                textColor: Colors.white,
              )),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: Column(
            children: [
              Text(
                "Product Details",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: Column(children: [
            Text(
              "Similar Products",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            SimilarProducts(),
          ]),
        )
      ]),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
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
          return SimilarProductItem(
              name: productList[index]["name"],
              picture: productList[index]["picture"],
              price: productList[index]["price"]);
        },
      ),
    );
  }
}

class SimilarProductItem extends StatelessWidget {
  final name;
  final picture;
  final price;

  SimilarProductItem(
      {required this.name, required this.picture, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                      name: name,
                      picture: picture,
                      price: price,
                    ))),
            child: GridTile(
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
              footer: Container(
                height: 50.0,
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
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
