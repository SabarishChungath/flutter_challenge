import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/screens/cart_screen.dart';
import 'package:riafy_flutter_challenge/widgets/header_widget.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "product_screen";

  final Product product;
  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product product;
  @override
  void initState() {
    super.initState();
    product = widget?.product;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);

    return SafeArea(
        child: Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
        child: Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.86),
          ),
          child: Center(
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: headerRow(
          title: product?.name?.toUpperCase(),
          context: context,
          rightIcon: provider.isPresentInWishList(product)
              ? Icons.favorite
              : Icons.favorite_outline_sharp,
          onPressRightIcon: () {
            provider.toggleWishList(product);
          }),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(product?.imageURL))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product?.name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ " + product?.price?.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    AddToCart(
                      product: product,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    child: Text(
                      product?.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    return !provider.isPresentInCart(product)
        ? GestureDetector(
            onTap: () {
              provider.addToCart(product);
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.86),
                  color: Colors.black),
              child: Center(
                  child: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          )
        : Stepper(
            product: product,
          );
  }
}

class Stepper extends StatelessWidget {
  const Stepper({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);

    return Container(
      height: 50,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.86), color: Colors.black),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => provider?.decreaseQuantity(product),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Center(
                  child: Text(
                provider?.getCurrentQuantity(product).toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => provider?.increaseQuantity(product),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
