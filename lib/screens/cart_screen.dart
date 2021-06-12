import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/modals/cart_item.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/widgets/header_widget.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "cart_screen";
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar:
          headerRow(title: "CART", context: context, rightIcon: Icons.search),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: provider.cart.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (_, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: provider.cart.length,
                        itemBuilder: (_, index) {
                          CartItem cartItem = provider.cart[index];
                          return Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.86),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              cartItem.product.imageURL))),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    cartItem.product.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      cartItem.quantity.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                    : Center(
                        child: Text(
                          "No items in cart.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )),
          ],
        ),
      ),
    ));
  }
}
