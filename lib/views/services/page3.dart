import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/routes/route_helper.dart';

import '../../utiles/colors.dart';

class Page3 extends StatefulWidget {
  Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
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

class _Page3State extends State<Page3> {
  @override
  void initState() {
    signnotification();
    getMessage();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                ": قسم رئيس الوحدة ",
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
                "في حال أردت عرض التدخلات      ",
                style: TextStyle(
                  color: Color.fromARGB(255, 28, 4, 73),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getPage3_1());
                },
                child: Text(
                  "انقر هنا",
                  style: TextStyle(
                    color: AppColors.maincolor,
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
