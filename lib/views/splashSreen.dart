import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';

import '../routes/route_helper.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
 

  @override
  void initState() {
    sharedpref!.clear();
    super.initState();
    
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 4),
        () => Get.offNamed(RouteHelper.getHomepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                "assets/images/received_470496364873811.webp",
                width: 200,
                height: 400,
              ))),
               Text("ولاية قالمة",style: TextStyle(fontSize: 70,color: AppColors.maincolor,fontWeight: FontWeight.w900),)
              
        ],
      ),
    );
  }
}
