import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';
import 'package:kalma_protection/utiles/dimention.dart';
import 'package:kalma_protection/views/services/page6_2.dart';
import 'package:kalma_protection/widgets/app_text_field.dart';
import 'package:kalma_protection/widgets/mybutton.dart';

import '../../routes/route_helper.dart';

class UpdateUser extends StatefulWidget {
  UpdateUser({Key? key}) : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  List user = [];
  var emailController = TextEditingController();
  var passwordlController = TextEditingController();
  getusers() async {
    CollectionReference taskref =
        FirebaseFirestore.instance.collection("users");
    await taskref
        .where("id", isEqualTo: sharedpref!.getString("iduser"))
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          user.add(element.data());

          emailController.text = element['username'];
          passwordlController.text = element['password'];
        });
      });
    });
  }

  @override
  void initState() {
    getusers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: emailController,
              hintText: " ادخل اسم مستخدم جديد",
              icon: Icons.person,
            ),
            SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: passwordlController,
              hintText: "ادخل كلمة مرور جديدة",
              icon: Icons.password_outlined,
              isObscure: true,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () async {
                  _validateData();
                  Get.back();
                },
                child: ResponseveButton(name: "تعديل المستخدم")),
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

  _validateData() {
    if (emailController.text.isNotEmpty && passwordlController.text.isNotEmpty) {
      _addTaskToDB();

      Get.back();
      Get.snackbar("حسنا", "تم التعديل بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.offline_pin_sharp));
    } else if (emailController.text.isEmpty || passwordlController.text.isEmpty) {
      Get.snackbar("ضروري", "كل الحقول ضرورية",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.warning_amber_rounded));
    }
  }
   _addTaskToDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("users");
    userref.doc(sharedpref!.getString("iduser")).update({
      "username": emailController.text,
     
      "password": passwordlController.text,
     
    }).then((value) {
      print("sucsess");
    }).catchError((e) {
      print("error : $e");
    });
  }
}
