import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/screens/wishlist_screen.dart';
import 'package:riafy_flutter_challenge/widgets/header_widget.dart';
import 'package:riafy_flutter_challenge/widgets/home_header.dart';
import 'package:riafy_flutter_challenge/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home_screen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: headerRow(
            title: "HOME",
            context: context,
            rightIcon: Icons.favorite,
            onPressRightIcon: () {
              Navigator.of(context).pushNamed(WishListScreen.routeName);
            }),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.green[100],
          child: Column(
            children: [
              HomeHeader(),
              Flexible(
                flex: 1,
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
            ],
          ),
        ),
      ),
    );
  }
}
