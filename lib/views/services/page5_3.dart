import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalma_protection/main.dart';
import 'package:kalma_protection/utiles/colors.dart';
import 'package:http/http.dart' as http;

import '../../widgets/button.dart';
import '../../widgets/input_faild.dart';

class UpdateTaskPage extends StatefulWidget {
  UpdateTaskPage({Key? key}) : super(key: key);

  @override
  _UpdateTaskPageState createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  var tasks = [];

  gettasks() async {
    CollectionReference taskref = FirebaseFirestore.instance.collection("task");
    await taskref
        .where("id", isEqualTo: sharedpref!.getString("idtask"))
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          tasks.add(element.data());
            _titleController.text = element['title'];
            _w.text = element['w'];
        _noteController.text = element['cars'];
        _namephoner.text = element['name'];
        _phonenumber.text = element['phone'];
        selected = element['materiallosess'];
        selected1 =element['humanlosses'];
         
        });
      
      });
    });
  }

 

  @override
  void initState() {
    gettasks();
    
    super.initState();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _w = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  TextEditingController _namephoner = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();

  var selected;
  var selected1;
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "تعديل تدخل",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor),
              ),
              MyInputFaild(
                title: "نوع الحادث",
                hint: "أدخل نوع الحادث",
                controller: _titleController,
              ),
              MyInputFaild(
                title: "اسم المتصل ",
                hint: "أدخل اسم المتصل",
                controller: _namephoner,
              ),
              MyInputFaild(
                title: " العنوان ",
                hint: "أدخل العنوان ",
                controller: _w,
              ),
              MyInputFaild(
                title: "رقم المتصل ",
                hint: "أدخل رقم المتصل",
                controller: _phonenumber,
              ),
              MyInputFaild(
                title: "نوع المركبات ",
                hint: "ادخل نوع المركبات التي ستقوم بالخروج",
                controller: _noteController,
              ),
              MyInputFaild(
                title: "التاريخ",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: Icon(Icons.calendar_today_outlined,
                      color: AppColors.textcolor),
                ),
              ),
              MyInputFaild(
                title: "الوقت",
                hint: _startTime,
                widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(true);
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      color: AppColors.textcolor,
                    )),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  iconEnabledColor: AppColors.textcolor,
                  iconSize: 30,
                  itemHeight: 50,
                  dropdownColor: AppColors.textcolor,
                  hint: Text("هل يوجد خسائر مادية"),
                  items: [
                    " نعم",
                    "لا ",
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              "$e",
                              style: TextStyle(
                                  color: AppColors.maincolor,
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
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  iconEnabledColor: AppColors.textcolor,
                  iconSize: 30,
                  itemHeight: 50,
                  dropdownColor: AppColors.textcolor,
                  hint: Text("هل يوجد خسائر بشرية"),
                  items: [
                    " نعم",
                    "لا ",
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              "$e",
                              style: TextStyle(
                                  color: AppColors.maincolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    selected1 = val.toString();
                  },
                  value: selected1,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "تعديل التدخل",
                      ontap: () async {
                        _validateData();
                        Get.back();
                      })
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_noteController.text.isNotEmpty && _titleController.text.isNotEmpty) {
      _addTaskToDB();
       
      Get.back();
      Get.snackbar("حسنا", "تم التعديل بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.offline_pin_sharp));
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("ضروري", "كل الحقول ضرورية",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.warning_amber_rounded));
    }
  }

  _addTaskToDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("task");
    userref.doc(sharedpref!.getString("idtask")).update({
      "title": _titleController.text,
      "w": _w.text,
      "cars": _noteController.text,
      "name": _namephoner.text,
      "phone": _phonenumber.text,
      "date": DateFormat.yMd().format(_selectedDate),
      "time": _startTime,
      "humanlosses": selected1,
      "materiallosess": selected
    }).then((value) {
      print("sucsess");
    }).catchError((e) {
      print("error : $e");
    });
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.textcolor,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("its null or something wrong");
    }
  }

  _getTimeFromUser(bool isStartTime) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {}
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
