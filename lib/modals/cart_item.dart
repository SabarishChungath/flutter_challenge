import 'package:flutter/cupertino.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';

class CartItem with ChangeNotifier {
  final Product product;
  final int quantity;
  CartItem({this.product, this.quantity});
}
