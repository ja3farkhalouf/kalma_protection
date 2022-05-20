import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';
import 'package:kalma_protection/utiles/dimention.dart';
import 'package:kalma_protection/widgets/app_text_field.dart';
import 'package:kalma_protection/widgets/mybutton.dart';


import '../../routes/route_helper.dart';

class AddNewUser extends StatefulWidget {
  AddNewUser({Key? key}) : super(key: key);

  @override
  _AddNewUserState createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordlController = TextEditingController();
    var selected;

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
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  iconEnabledColor: AppColors.maincolor,
                  iconSize: 30,
                  itemHeight: 50,
                  dropdownColor: AppColors.maincolor,
                  hint: Icon(Icons.person_add, color: AppColors.maincolor),
                  items: [
                    "عون إطفاء",
                    "رئيس قسم",
                    "رئيس وحدة",
                    "رئيس اعتماد",
                    "رئيس تنسيق العمليات",
                    "أدمين"
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              "$e",
                              style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    selected = val.toString();
                  },
                  value: selected,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: emailController,
              hintText: "ادخل اسم المستخدم",
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
                  CollectionReference userref =
                      await FirebaseFirestore.instance.collection("users");
                  userref.add({
                    "username": emailController.text,
                    "password": passwordlController.text,
                    "typeuser": selected
                  }).then((value) {
                    print("sucsess");
                  }).catchError((e) {
                    print("error : $e");
                  });
                },
                child: ResponseveButton(name: "إضافة مستخدم")),
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
