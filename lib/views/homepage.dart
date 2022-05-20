import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';
import 'package:kalma_protection/widgets/mybutton.dart';

import '../routes/route_helper.dart';
import '../utiles/dimention.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: Dimention.screenwidth / 1.2,
              height: Dimention.screenheigth / 4,
              child: Center(
                child: Image.asset(
                  "assets/images/received_470496364873811.webp",
                  width: Dimention.screenwidth / 1.1,
                  height: Dimention.screenheigth / 2,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 80),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  ": الأصناف ",
                  style: TextStyle(
                      color: AppColors.textcolor,
                      fontWeight: FontWeight.w900,
                      fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setString("role", "1");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "1") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "عون إطفائي")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setString("role", "2");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "2") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "رئيس قسم ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setString("role", "3");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "3") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "رئيس الوحدة ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setString("role", "4");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "4") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "رئيس الاعتماد ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () async {
                  await FirebaseMessaging.instance.subscribeToTopic('task');

                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setInt("order", 1);
                    sharedpref!.setString("role", "5");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "5") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "مركز التنسيق والعمليات ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  if (sharedpref!.getString("login") == null) {
                    sharedpref!.setString("role", "6");
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                  if (sharedpref!.getString("role") == "6") {
                    Get.toNamed(RouteHelper.getLoginPage());
                  }
                },
                child: ResponseveButton(name: "أدمين ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getPage7());
                },
                child: ResponseveButton(name: "عرض ورقة المداومة اليومية ")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  sharedpref!.clear();
                  Get.snackbar("حسنا", "تم تسجيل الخروج بنجاح",
                      titleText: Text(
                        "حسنا",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.w900),
                      ),
                      messageText: Text(
                        "تم تسجيل الخروج بنجاح",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Color.fromARGB(255, 17, 19, 62));
                },
                child: ResponseveButton(name: "تسجيل الخروج")),
          ],
        ),
      ),
    );
  }
}
