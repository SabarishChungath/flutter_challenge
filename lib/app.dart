import 'package:flutter/material.dart';
import 'package:riafy_flutter_challenge/screens/cart_screen.dart';
import 'package:riafy_flutter_challenge/screens/home_screen.dart';
import 'package:riafy_flutter_challenge/screens/onboarding_screen.dart';
import 'package:riafy_flutter_challenge/screens/product_screen.dart';
import 'package:riafy_flutter_challenge/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        OnBoardingScreen.routeName: (ctx) => OnBoardingScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProductScreen.routeName: (ctx) => CartScreen(),
      },
      home: SplashScreen(),
    );
  }
}
