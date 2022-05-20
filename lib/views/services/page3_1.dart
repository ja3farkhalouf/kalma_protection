import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utiles/colors.dart';

List tasks = [];

class HistoryTask extends StatefulWidget {
  HistoryTask({Key? key}) : super(key: key);

  @override
  State<HistoryTask> createState() => _HistoryTaskState();
}

class _HistoryTaskState extends State<HistoryTask> {
  CollectionReference taskref = FirebaseFirestore.instance.collection("task");
  gettasks() async {
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        tasks.add(element.data());
        taskref.doc(element.id.toString()).set({"id": element.id},SetOptions(merge: true));
        
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
                    Text(" الرقم  : $i",
                        style: TextStyle(
                          color: AppColors.maincolor,
                          fontWeight: FontWeight.w900,
                        )),
                    Divider(
                      thickness: 3,
                      color: AppColors.textcolor,
                    ),
                    Text(
                      "نوع الحادث  : ${tasks[i]['title']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اسم المتصل  :${tasks[i]['name']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "رقم المتصل  :${tasks[i]['phone']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "نوع المركبات  : ${tasks[i]['cars']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "تاريخ التدخل  :${tasks[i]['date']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "وقت التدخل  :${tasks[i]['time']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "هل يوجد خسائر مادية : ${tasks[i]['materiallosess']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "هل يوجد خسائر بشرية : ${tasks[i]['humanlosses']}",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            })
        //  Column(
        //   children: [
        //     Text(
        //       "عرض التدخلات",
        //       style: TextStyle(
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //           color: AppColors.textcolor),
        //     ),

        //   ],
        // ),

        );
  }
}

_appBar() {
  return AppBar(
    title: Text(
      "عرض التدخلات السابقة",
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
