import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/widgets/header_widget.dart';

class WishListScreen extends StatefulWidget {
  static String routeName = "wishlist_screen";
  const WishListScreen({Key key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: headerRow(
          title: "WISHLIST",
          context: context,
          rightIcon: Icons.search,
          onPressRightIcon: () {
            //TODO:
            // Navigator.of(context).pushNamed(SearchScreen.routeName);
          }),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: provider.wishList.isEmpty
            ? Center(
                child: Text(
                "No Products in Wishlist...",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
            : ListView.separated(
                itemCount: provider.wishList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  Product product = provider.wishList[index];
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
                                  image: NetworkImage(product.imageURL))),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.toggleWishList(product);
                          },
                          child: Icon(
                            provider.isPresentInWishList(product)
                                ? Icons.favorite
                                : Icons.favorite_outline_sharp,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    ));
  }
}
