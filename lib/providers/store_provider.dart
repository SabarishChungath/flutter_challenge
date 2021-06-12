import 'package:flutter/cupertino.dart';
import 'package:riafy_flutter_challenge/modals/cart_item.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';
import 'package:riafy_flutter_challenge/strings.dart' as values;

class StoreProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      sku: "8081AA",
      imageURL:
          "https://images.pexels.com/photos/4394243/pexels-photo-4394243.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 1",
      description: values.description,
      price: 1.00,
    ),
    Product(
      sku: "8082AB",
      imageURL:
          "https://images.pexels.com/photos/912410/pexels-photo-912410.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 2",
      description: values.description,
      price: 1.12,
    ),
    Product(
      sku: "8083AC",
      imageURL:
          "https://images.pexels.com/photos/4946961/pexels-photo-4946961.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 3",
      description: values.description,
      price: 1.25,
    ),
    Product(
      sku: "8084AD",
      imageURL:
          "https://images.pexels.com/photos/3408057/pexels-photo-3408057.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 4",
      description: values.description,
      price: 4.00,
    ),
    Product(
      sku: "8084AE",
      imageURL:
          "https://images.pexels.com/photos/2249959/pexels-photo-2249959.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 5",
      description: values.description,
      price: 15.70,
    ),
    Product(
      sku: "8085AF",
      imageURL:
          "https://images.pexels.com/photos/3094208/pexels-photo-3094208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 6",
      description: values.description,
      price: 14.23,
    ),
    Product(
      sku: "8086AG",
      imageURL:
          "https://images.pexels.com/photos/6297518/pexels-photo-6297518.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 7",
      description: values.description,
      price: 12.27,
    ),
    Product(
      sku: "8087AH",
      imageURL:
          "https://images.pexels.com/photos/3965520/pexels-photo-3965520.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 8",
      description: values.description,
      price: 11.25,
    ),
    Product(
      sku: "80899H",
      imageURL:
          "https://images.pexels.com/photos/4272616/pexels-photo-4272616.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 9",
      description: values.description,
      price: 10.08,
    ),
    Product(
      sku: "80009H",
      imageURL:
          "https://images.pexels.com/photos/7354544/pexels-photo-7354544.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "model 10",
      description: values.description,
      price: 12.25,
    )
  ];

  List<CartItem> _cart = [];

  Filter _currentFilter = Filter.none;

  set currentFilter(value) {
    _currentFilter = value;
    notifyListeners();
  }

  get currentFilter {
    return _currentFilter;
  }

  get products {
    switch (_currentFilter) {
      case Filter.priceLessThan4:
        var priceLessThan4 =
            _products.where((product) => product.price <= 4).toList();
        return priceLessThan4;
        break;
      case Filter.pricelessThan10:
        var priceLessThan10 =
            _products.where((product) => product.price <= 10).toList();
        return priceLessThan10;
      default:
        return [..._products];
    }
  }

  get cart {
    return [..._cart];
  }

  addToCart(Product product) {
    bool isPresent = isPresentInCart(product);
    if (!isPresent) {
      _cart.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  removeFromCart(Product product) {
    _cart.removeWhere((element) => element.product.sku == product.sku);
    notifyListeners();
  }

  increaseQuantity(Product product) {
    for (var cartItem in _cart) {
      if (cartItem.product == product) {
        cartItem.quantity += 1;
      }
    }
    notifyListeners();
  }

  decreaseQuantity(Product product) {
    var currentQuantity = getCurrentQuantity(product);
    if (currentQuantity <= 1) {
      removeFromCart(product);
      return;
    }
    for (var cartItem in _cart) {
      if (cartItem.product == product) {
        cartItem.quantity -= 1;
      }
    }
    notifyListeners();
  }

  int getCurrentQuantity(Product product) {
    CartItem cartItem;
    _cart.forEach((element) {
      if (element.product == product) {
        cartItem = element;
      }
    });
    if (cartItem != null) {
      return cartItem.quantity;
    } else {
      return 0;
    }
  }

  bool isPresentInCart(Product product) {
    bool isPresent = false;
    _cart.forEach((element) {
      if (element.product.sku == product.sku) {
        isPresent = true;
        return isPresent;
      }
    });
    return isPresent;
  }
}

enum Filter { priceLessThan4, pricelessThan10, none }
