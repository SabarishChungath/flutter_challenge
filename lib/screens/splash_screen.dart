import 'package:flutter/material.dart';
import 'package:riafy_flutter_challenge/screens/home_screen.dart';
import 'package:riafy_flutter_challenge/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splash_screen";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), loadNextScreen);
  }

  void loadNextScreen() async {
    //check if onboarding completed.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingCompleted = prefs.getBool("onboarded") ?? false;
    if (isOnboardingCompleted) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);
      // prefs.setBool("onboarded", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage("assets/images/splashImage.jpeg"),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Text(
                      "PICO",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
