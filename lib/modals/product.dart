import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final double price;
  final String imageURL;
  final String description;
  final String name;
  final String sku;

  Product({this.price, this.imageURL, this.description, this.name, this.sku});
}
