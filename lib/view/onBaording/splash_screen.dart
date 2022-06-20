import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/onBaording/on_baording_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin{

  Future<String> updateSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    return "-1";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      color: ColorsApp().primary,
      child: Image.asset('assets/images/logo.jpg',),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    await updateSplash();
    AppRoute.pushReplacement(const OnBoardingScreen(),name: '');
  }
}
