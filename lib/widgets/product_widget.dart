import 'package:flutter/material.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.86), color: Colors.transparent),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.86),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        product.imageURL,
                      )),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.name.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ),
                Text(
                  "\$" + product.price.toStringAsFixed(2),
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black87),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
