import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';

import '../../routes/route_helper.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

signnotification() async {
  await FirebaseMessaging.instance.subscribeToTopic('task');
}

getMessage() {
  FirebaseMessaging.onMessage.listen((message) {
    Get.snackbar("اشعار", "استقبل التطبيق اشعار بالتدخل",
        titleText: Text(
          "اشعار",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          "استقبل التطبيق اشعار بالتدخل",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        icon: Icon(Icons.warning_amber_rounded),
        backgroundColor: Color.fromARGB(255, 9, 157, 139));
    Get.toNamed(RouteHelper.getPage8());
  });
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    signnotification();
    getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                ": قسم أعوان الإطفاء ",
                style: TextStyle(
                    color: AppColors.textcolor,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.sim_card_alert_outlined,
            size: 120.0,
            color: AppColors.maincolor,
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Color.fromARGB(255, 28, 4, 73),
            ),
            child: Text("! يمكنك تلقي الانذار في اي وقت  انتبه"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "في حال أردت الرجوع  ",
                style: TextStyle(
                  color: Color.fromARGB(255, 28, 4, 73),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "انقر هنا",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
