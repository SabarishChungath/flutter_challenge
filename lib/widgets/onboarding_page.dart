import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {Key key,
      @required this.imageURL,
      @required this.titlePrefix,
      @required this.titleSuffix,
      @required this.subTitle})
      : super(key: key);

  final String imageURL;
  final String titlePrefix;
  final String titleSuffix;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            imageURL,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(children: [
              TextSpan(
                text: titlePrefix,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 25),
              ),
              TextSpan(
                text: " " + titleSuffix,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 25),
              )
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
