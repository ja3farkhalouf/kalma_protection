import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/routes/route_helper.dart';

import '../../utiles/colors.dart';
import '../../utiles/dimention.dart';
import '../../widgets/mybutton.dart';

class Page5 extends StatefulWidget {
  Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
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
                ": مركز التنسيق والعكليات  ",
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
                Get.toNamed(RouteHelper.getPage5_5());
              },
              child: ResponseveButton(name: "إضافة تدخل جديد  ")),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPage5_2());
              },
              child: Container(
                width: Dimention.screenwidth / 1.3,
                height: Dimention.screenheigth / 19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 79, 91, 182)),
                child: Center(
                    child: Text(
                  "حذف / تعديل ",
                  style: TextStyle(
                      color: AppColors.textcolor, fontWeight: FontWeight.w900),
                )),
              )),
        ],
      ),
    );
  }
}
