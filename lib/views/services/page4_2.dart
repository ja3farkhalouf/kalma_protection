import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/routes/route_helper.dart';

import '../../utiles/colors.dart';

List tasks = [];


class HistoryUpdateTakrer extends StatefulWidget {
  HistoryUpdateTakrer({Key? key}) : super(key: key);

  @override
  State<HistoryUpdateTakrer> createState() => _HistoryUpdateTakrerState();
}

class _HistoryUpdateTakrerState extends State<HistoryUpdateTakrer> {
  CollectionReference taskref = FirebaseFirestore.instance.collection("takrer");
  gettasks() async {
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        tasks.add(element.data());
      });
        
        
       
      
    });
  }

  @override
  void initState() {
    tasks = [];
    gettasks();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(top: 40, right: 20, left: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.textcolor,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(10, 10))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      " تقرير في  : ${tasks[i]['date']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "الوحدة   :${tasks[i]['alwehda']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "الفرقة   :${tasks[i]['alfrka']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "الرقم   : ${tasks[i]['alrakam']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "استمارة التدخل ",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Divider(
                      thickness: 3,
                      color: AppColors.maincolor,
                    ),

                    Text(
                      "نوع التدخل  :${tasks[i]['type']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "نوع المركبة  :${tasks[i]['typecar']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "وقت الخروج : ${tasks[i]['outtime']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " الوصول: ${tasks[i]['arrivedtime']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " وقت انتهاء العملية: ${tasks[i]['finishtime']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " وقت الدخول: ${tasks[i]['intime']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " مكان التدخل: ${tasks[i]['place']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " بلدية: ${tasks[i]['ba']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " دائرة: ${tasks[i]['da']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " طبيعة الحادث: ${tasks[i]['th']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " اسباب الحادث: ${tasks[i]['ah']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " صنف الطريق: ${tasks[i]['st']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ر.ت المركبة: ${tasks[i]['rtm']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //=============================================
                    Text(
                      "    الضحايا",
                      style: TextStyle(
                        color: AppColors.maincolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  Container(
                                margin: EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.textcolor,
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                          offset: Offset(10, 10))
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      "   الاسم",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " اللقب",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " السن",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " الجنس",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " حالة الضحية ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['name']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['name2']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['age']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['sex']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['hd']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['nameb']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['name2b']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['ageb']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['sexb']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['hdb']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['namec']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['name2c']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['agec']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['sexc']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['hdc']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['named']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['name2d']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['aged']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['sexd']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['hdd']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                      ],
                                    ),
                                  
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                )),
                       
                    Divider(
                      thickness: 3,
                      height: 20,
                      color: AppColors.textcolor,
                    ),

                    //===============================هتا الضحايا==========================================
                    Text(
                      " الاسعافات المقدمة: ${tasks[i]['im']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " الخسائر المسجلة : ${tasks[i]['khm']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " الوسائل والعتاد المستعمل: ${tasks[i]['wam']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " الأملاك المنفذة : ${tasks[i]['am']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ملخص التدخل : ${tasks[i]['mt']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " الإجلاء  : ${tasks[i]['i']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " نقل الضحية الى : ${tasks[i]['ndi']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //=============================================
                    Text(
                      "  المتدخلون",
                      style: TextStyle(
                        color: AppColors.maincolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  تدخل اول :",
                          style: TextStyle(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                         SizedBox(
                          width: 10,
                        ),
                        if(tasks[i]["t1"]==true)
                        Text(
                          "نعم",
                          style: TextStyle(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  تدخل الدعم :",
                          style: TextStyle(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                         SizedBox(
                          width: 10,
                        ),
                        if(tasks[i]["td"]==true)
                        Text(
                          "نعم",
                          style: TextStyle(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                                margin: EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.textcolor,
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                          offset: Offset(10, 10))
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      "   اللقب",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " الاسم",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " المهنة",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " الرتبة",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                 

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['namet1']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['namet']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['workt']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['rt']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['namet1b']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['nametb']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['worktb']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['rtb']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['namet1c']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['nametc']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['worktc']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['rtc']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Text(
                                      " ${tasks[i]['namet1d']}  ",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['nametd']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['worktd']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      " ${tasks[i]['rtd']}",
                                      style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  

                                      ],
                                    ),
                                  
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                )),

                    
                    Divider(
                      thickness: 3,
                      height: 20,
                      color: AppColors.textcolor,
                    ),
                     Text(
                      "  الحاضرون:",
                      style: TextStyle(
                        color: AppColors.maincolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  الدرك الوطني :",
                          style: TextStyle(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if(tasks[i]["dw"]==true)
                        Text(
                          "نعم",
                          style: TextStyle(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  أمن  وطني :",
                          style: TextStyle(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                         SizedBox(
                          width: 10,
                        ),
                        if(tasks[i]["aw"]==true)
                        Text(
                          "نعم",
                          style: TextStyle(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //===============================هتا المتدخلون==================================
                    Text(
                      "   رئيس العدد  :${tasks[i]['ra']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "   ضابط منسق الاسعافات  :${tasks[i]['dmi']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "   رئيس الوحدة  :${tasks[i]['rw']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              );
            }));
  }
}

_appBar() {
  return AppBar(
    title: Text(
      "صفحة عرض التقارير  ",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.bgcolor,
      ),
    ),
    elevation: 0,
    backgroundColor: AppColors.textcolor,
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: AppColors.bgcolor,
      ),
      onTap: () {
        Get.back();
      },
    ),
    actions: [
      CircleAvatar(
        backgroundImage:
            AssetImage("assets/images/received_470496364873811.webp"),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}
