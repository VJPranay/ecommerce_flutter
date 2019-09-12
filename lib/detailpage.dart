import 'package:flutter/material.dart';

import 'models/product.dart';

class ProductDetailPage extends StatefulWidget {

  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}
