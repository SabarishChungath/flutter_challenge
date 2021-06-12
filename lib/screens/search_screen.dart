import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/modals/product.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/screens/cart_screen.dart';
import 'package:riafy_flutter_challenge/widgets/header_widget.dart';
import 'package:riafy_flutter_challenge/widgets/product_widget.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "search_screen";
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> filteredProducts;

  @override
  void initState() {
    super.initState();
    var provider = Provider.of<StoreProvider>(context, listen: false);
    filteredProducts = [...provider.products];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    final _textEditingController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: headerRow(
            title: "SEARCH",
            context: context,
            rightIcon: Icons.shopping_cart_outlined,
            onPressRightIcon: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            }),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0XFFF5F5F8),
                  border: Border.all(width: 1.1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(8.83),
                ),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search for Products',
                    hintStyle: TextStyle(
                      color: Color(0XFF494B4B).withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onChanged: (String searchQuery) {
                    var searchResults = [];
                    var products = provider.products;
                    if (searchQuery == "") {
                      filteredProducts = [...products];
                      setState(() {});
                      return;
                    }
                    products.forEach((Product product) {
                      if (product.name.contains(searchQuery)) {
                        searchResults.add(product);
                      }
                    });
                    filteredProducts = [...searchResults];
                    setState(() {});
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: filteredProducts.isNotEmpty
                    ? StaggeredGridView.countBuilder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        crossAxisCount: 6,
                        itemCount: filteredProducts.length,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        itemBuilder: (_, index) {
                          var products = filteredProducts;
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
                        })
                    : Text("No Results..."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
