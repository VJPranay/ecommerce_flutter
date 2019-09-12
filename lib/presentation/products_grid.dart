import 'package:ecommerce_app/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductsGrid extends StatefulWidget {
  final List<Product> products;

  ProductsGrid({@required this.products});

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return widget.products == null
        ? Center(child: CircularProgressIndicator())
        : new GridView.builder(
            itemCount: widget.products.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: new InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailPage(
                        product: widget.products[index],
                      );
                    }));
                  },
                  child: Card(
                    color: Colors.transparent,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Image.network(
                            "http://www.pngmart.com/files/7/School-Bag-PNG-Background-Image.png",
                            width: MediaQuery.of(context).size.width*0.3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Align(alignment: Alignment.bottomCenter,
                              child: Text(widget.products[index].title)),
                        ),
                        Align(alignment: Alignment.bottomCenter,
                            child: Text(widget.products[index].price)),

                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              );
            });
    ;
  }
}
