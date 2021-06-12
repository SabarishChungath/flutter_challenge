import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home_screen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> urls = [
    "https://images.pexels.com/photos/556666/pexels-photo-556666.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/919278/pexels-photo-919278.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 50),
          width: double.infinity,
          height: double.infinity,
          color: Colors.green[100],
          child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 6,
              itemCount: provider.products.length,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              itemBuilder: (_, index) {
                var products = provider.products;
                return Container(
                  color: Colors.transparent,
                  width: 250,
                  height: 290,
                  child: Column(
                    mainAxisAlignment: index.isEven
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    crossAxisAlignment: index.isEven
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: index.isEven
                            ? EdgeInsets.only(right: 12)
                            : EdgeInsets.only(left: 12),
                        child: ProductWidget(
                          product: products[index],
                        ),
                      )
                    ],
                  ),
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(3, 5);
              }),
        ),
      ),
    );
  }
}
