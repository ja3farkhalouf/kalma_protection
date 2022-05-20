import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/routes/route_helper.dart';

import '../../utiles/colors.dart';
import '../../utiles/dimention.dart';
import '../../widgets/mybutton.dart';

class Page4 extends StatefulWidget {
  Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
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

class _Page4State extends State<Page4> {
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
                ": قسم رئيس الإعتماد  ",
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
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPage4_1());
              },
              child: ResponseveButton(name: "إضافة تقرير جديد  ")),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPage4_2());
              },
              child: Container(
                width: Dimention.screenwidth / 1.3,
                height: Dimention.screenheigth / 19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 79, 91, 182)),
                child: Center(
                    child: Text(
                  ": عرض التقارير",
                  style: TextStyle(
                      color: AppColors.textcolor, fontWeight: FontWeight.w900),
                )),
              )),
        ],
      ),
    );
  }
}
