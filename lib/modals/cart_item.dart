import 'package:flutter/cupertino.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';

class CartItem with ChangeNotifier {
  Product product;
  int quantity;
  CartItem({this.product, this.quantity});
}
