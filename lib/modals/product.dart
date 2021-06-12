import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final double price;
  final String imageURL;
  final String description;
  final String name;

  bool get isProductLiked {
    //implement provider functionality
  }

  Product({this.price, this.imageURL, this.description, this.name});
}
