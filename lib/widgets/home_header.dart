import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riafy_flutter_challenge/providers/store_provider.dart';
import 'package:riafy_flutter_challenge/widgets/home_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // color: Colors.orange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeButton(
            bgColor: Colors.white,
            borderColor: Colors.black38,
            length: 40,
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
            onPress: () {
              print("go to search");
            },
          ),
          HomeButton(
            bgColor: Colors.white,
            borderColor: Colors.black38,
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
              size: 25,
            ),
            length: 40,
            onPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox();
                  });
            },
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.86),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                HomeButton(
                  length: 25,
                  bgColor: Colors.black,
                  borderColor: Colors.white,
                  child: Text(
                    Provider.of<StoreProvider>(context).cart.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPress: null,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context, listen: false);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Column(
            children: [
              Text(
                "Filter by price",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              ListTile(
                onTap: () {
                  provider.currentFilter = Filter.priceLessThan4;
                  Navigator.of(context).pop();
                },
                tileColor: Provider.of<StoreProvider>(context).currentFilter ==
                        Filter.priceLessThan4
                    ? Colors.green
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.00),
                ),
                title: Text("price less than \$4"),
              ),
              ListTile(
                onTap: () {
                  provider.currentFilter = Filter.pricelessThan10;
                  Navigator.of(context).pop();
                },
                tileColor: Provider.of<StoreProvider>(context).currentFilter ==
                        Filter.pricelessThan10
                    ? Colors.green
                    : Colors.transparent,
                title: Text("price less than \$10"),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    provider.currentFilter = Filter.none;
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "CLEAR FILTERS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0),
                  ))
            ],
          )),
    );
  }
}
