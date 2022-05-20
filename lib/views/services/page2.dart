import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utiles/colors.dart';
import '../../widgets/mybutton.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
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

class _Page2State extends State<Page2> {
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
                ": رئيس القسم ",
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
            Icons.add,
            size: 120.0,
            color: AppColors.maincolor,
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPage2_2());
              },
              child: ResponseveButton(name: "إضافة ورقة الحراسة  ")),
        ],
      ),
    );
  }
}
