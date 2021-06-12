import 'package:flutter/material.dart';
import 'package:riafy_flutter_challenge/screens/home_screen.dart';

class PageInfo {
  PageInfo({
    this.titlePrefix,
    this.titleSuffix,
    this.subTitle,
    this.imageURL,
  });
  final String titlePrefix;
  final String titleSuffix;
  final String subTitle;
  final String imageURL;
}

List pages = [
  PageInfo(
      titlePrefix: "MODULAR",
      titleSuffix: "PLANT 1",
      imageURL: "assets/images/onb1.jpeg",
      subTitle:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  PageInfo(
      titlePrefix: "MODULAR",
      titleSuffix: "PLANT 2",
      imageURL: "assets/images/onb2.webp",
      subTitle: "subTitle 2"),
  PageInfo(
      titlePrefix: "MODULAR",
      titleSuffix: "PLANT 3",
      imageURL: "assets/images/onb3.webp",
      subTitle: "subTitle 3"),
];

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "onboarding_screen";
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0);

  moveToNextPage() {
    if (_currentPage != pages.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  Widget paginationBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 3,
      width: 18,
      decoration: BoxDecoration(
          color: isActive ? Colors.green : Color(0XFF08C25E).withOpacity(0.4),
          shape: BoxShape.rectangle),
    );
  }

  Widget generatePaginationBars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < pages.length; i++)
          if (i == _currentPage) ...[paginationBar(true)] else
            paginationBar(false),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 50,
              color: Colors.white,
              child: Center(
                child: generatePaginationBars(),
              ),
            ),
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey,
                    child: Center(
                      child: PageView.builder(
                        itemCount: pages.length,
                        controller: _controller,
                        onPageChanged: (index) =>
                            setState(() => _currentPage = index),
                        itemBuilder: (_, index) {
                          PageInfo page = pages[index];
                          return OnboardingPage(
                            imageURL: page.imageURL,
                            titleSuffix: page.titleSuffix,
                            titlePrefix: page.titlePrefix,
                            subTitle: page.subTitle,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, left: 20),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: IconButton(
                            onPressed: moveToNextPage,
                            icon: Icon(Icons.chevron_right),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
