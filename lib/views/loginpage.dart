import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';

import '../routes/route_helper.dart';
import '../utiles/dimention.dart';
import '../widgets/app_text_field.dart';
import '../widgets/mybutton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordlController = TextEditingController();

    authuser(typeuser) async {
      CollectionReference userref =
          await FirebaseFirestore.instance.collection("users");
      await userref
          .where("typeuser", isEqualTo: typeuser)
          .where("username", isEqualTo: emailController.text)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.data());
          print("====================================================");
          if (element["username"] == emailController.text &&
              element["password"] == passwordlController.text) {
            sharedpref!.setString("login", "yes");
            if (sharedpref!.getString("role") == "1") {
              Get.offNamed(RouteHelper.getPage1());
            } else if (sharedpref!.getString("role") == "2") {
              Get.offNamed(RouteHelper.getPage2());
            } else if (sharedpref!.getString("role") == "3") {
              Get.offNamed(RouteHelper.getPage3());
            } else if (sharedpref!.getString("role") == "4") {
              Get.offNamed(RouteHelper.getPage4());
            } else if (sharedpref!.getString("role") == "5") {
             
              Get.offNamed(RouteHelper.getPage5());
            } else if (sharedpref!.getString("role") == "6") {
              Get.offNamed(RouteHelper.getPage6());
            }
          }
        });
      });

      if (sharedpref!.getString("login") == null) {
        print("===================error=============");
        Get.snackbar("خطأ", "يوجد خطا في المصادقة تأكد من البريد وكلمة السر",
            titleText: Text(
              "خطأ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            messageText: Text(
              "يوجد خطا في المصادقة تأكد من البريد وكلمة السر",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            icon: Icon(Icons.warning_amber_rounded),
            backgroundColor: Colors.redAccent);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 30),
              width: Dimention.screenwidth / 1.2,
              height: Dimention.screenheigth / 4,
              child: Center(
                child: Image.asset(
                  "assets/images/received_470496364873811.webp",
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppTextField(
              textController: emailController,
              hintText: "ادخل بريدك الالكتروني",
              icon: Icons.person,
            ),
            SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: passwordlController,
              hintText: "ادخل كلمة المرور",
              icon: Icons.password_outlined,
              isObscure: true,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () async {
                  if (sharedpref!.getString("role") == "1") {
                    authuser("عون إطفاء");
                  } else if (sharedpref!.getString("role") == "2") {
                    authuser("رئيس قسم");
                  } else if (sharedpref!.getString("role") == "3") {
                    authuser("رئيس وحدة");
                  } else if (sharedpref!.getString("role") == "4") {
                    authuser("رئيس اعتماد");
                  } else if (sharedpref!.getString("role") == "5") {
                    authuser("رئيس تنسيق العمليات");
                  } else if (sharedpref!.getString("role") == "6") {
                    authuser("أدمين");
                  }
                },
                child: ResponseveButton(name: "تسجيل الدخول")),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: ResponseveButton(name: "الرجوع ")),
          ],
        ),
      ),
    );
  }
}
