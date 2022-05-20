import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/routes/route_helper.dart';

import '../../utiles/colors.dart';

List users = [];
List userid = [];

class HistoryUpdateUser extends StatefulWidget {
  HistoryUpdateUser({Key? key}) : super(key: key);

  @override
  State<HistoryUpdateUser> createState() => _HistoryUpdateUserState();
}

class _HistoryUpdateUserState extends State<HistoryUpdateUser> {
  CollectionReference taskref = FirebaseFirestore.instance.collection("users");
  getusers() async {
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        users.add(element.data());
        taskref
            .doc(element.id.toString())
            .set({"id": element.id}, SetOptions(merge: true));
        userid.add(element.id);
      });
    });
  }

  delettask() {
    taskref.doc(sharedpref!.getString("iduser")).delete().then((value) {
      setState(() {});
      print("sucsess  delet");
      Get.snackbar("حسنا", "تم  حذف المستخدم بنجاح",
          titleText: Text(
            "حسنا",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: AppColors.maincolor, fontWeight: FontWeight.w900),
          ),
          messageText: Text(
            "تم حذف المستخدم بنجاح",
            textAlign: TextAlign.right,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color.fromARGB(255, 17, 19, 62));
    });
  }

  @override
  void initState() {
    users = [];
    getusers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: ListView.builder(
            itemCount: users.length,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            sharedpref!.setString("iduser", users[i]['id']);
                            delettask();
                            Get.back();
                          },
                          child: Icon(Icons.delete,
                              size: 30, color: AppColors.textcolor),
                        ),
                        GestureDetector(
                          onTap: () {
                            sharedpref!.setString("iduser", users[i]['id']);
                            print(
                                "================================================");
                            print("the task id for update is${users[i]['id']}");
                            Get.toNamed(RouteHelper.getPage6_3());
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: AppColors.textcolor,
                          ),
                        ),
                      
                      ],
                    ),
                    Divider(
                      thickness: 3,
                      color: AppColors.textcolor,
                    ),
                    Text(
                      "${users[i]['username']}  :اسم المستخدم  ",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${users[i]['password']} :كلمة المرور  ",
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "نوع المسنخدم  :${users[i]['typeuser']}",
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
      "عرض المستخدمين ",
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
