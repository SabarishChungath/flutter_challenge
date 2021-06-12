import 'package:flutter/material.dart';
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
              onPress: () => print("filter")),
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
                    "1",
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
