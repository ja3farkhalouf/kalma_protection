import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalma_protection/utiles/colors.dart';
import 'package:http/http.dart' as http;

import '../../widgets/button.dart';
import '../../widgets/input_faild.dart';

class Addtakrer extends StatefulWidget {
  Addtakrer({Key? key}) : super(key: key);

  @override
  _AddtakrerState createState() => _AddtakrerState();
}

class _AddtakrerState extends State<Addtakrer> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _alwehda = TextEditingController();
  final TextEditingController _alfrka = TextEditingController();
  final TextEditingController _alrakam = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _type = TextEditingController();
  final TextEditingController _typecar = TextEditingController();
  final TextEditingController _outtime = TextEditingController();
  final TextEditingController _arrivedtime = TextEditingController();
  final TextEditingController _finishtime = TextEditingController();
  final TextEditingController _intime = TextEditingController();

  final TextEditingController _place = TextEditingController();
  final TextEditingController _ba = TextEditingController();
  final TextEditingController _da = TextEditingController();
  final TextEditingController _th = TextEditingController();
  final TextEditingController _ah = TextEditingController();
  final TextEditingController _st = TextEditingController();
  final TextEditingController _rtm = TextEditingController();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _hd = TextEditingController();
  final TextEditingController _nameb = TextEditingController();
  final TextEditingController _name2b = TextEditingController();
  final TextEditingController _ageb = TextEditingController();
  final TextEditingController _sexb = TextEditingController();
  final TextEditingController _hdb = TextEditingController();
  final TextEditingController _namec = TextEditingController();
  final TextEditingController _name2c = TextEditingController();
  final TextEditingController _agec = TextEditingController();
  final TextEditingController _sexc = TextEditingController();
  final TextEditingController _hdc = TextEditingController();
  final TextEditingController _named = TextEditingController();
  final TextEditingController _name2d = TextEditingController();
  final TextEditingController _aged = TextEditingController();
  final TextEditingController _sexd = TextEditingController();
  final TextEditingController _hdd = TextEditingController();

  final TextEditingController _im = TextEditingController();
  final TextEditingController _khm = TextEditingController();
  final TextEditingController _wam = TextEditingController();
  final TextEditingController _am = TextEditingController();
  final TextEditingController _mt = TextEditingController();
  final TextEditingController _i = TextEditingController();
  final TextEditingController _ndi = TextEditingController();

  bool _t1 = true;
  bool _td = false;

  final TextEditingController _namet1 = TextEditingController();
  final TextEditingController _namet = TextEditingController();
  final TextEditingController _workt = TextEditingController();
  final TextEditingController _rt = TextEditingController();
  final TextEditingController _namet1b = TextEditingController();
  final TextEditingController _nametb = TextEditingController();
  final TextEditingController _worktb = TextEditingController();
  final TextEditingController _rtb = TextEditingController();
  final TextEditingController _namet1c = TextEditingController();
  final TextEditingController _nametc = TextEditingController();
  final TextEditingController _worktc = TextEditingController();
  final TextEditingController _rtc = TextEditingController();
  final TextEditingController _namet1d = TextEditingController();
  final TextEditingController _nametd = TextEditingController();
  final TextEditingController _worktd = TextEditingController();
  final TextEditingController _rtd = TextEditingController();

  bool _dw = true;
  bool _aw = false;

  final TextEditingController _ra = TextEditingController();
  final TextEditingController _dmi = TextEditingController();
  final TextEditingController _rw = TextEditingController();

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
                "إضافة تقرير",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor),
              ),
              MyInputFaild(
                title: "الوحدة ",
                hint: "أدخل  الوحدة",
                controller: _alwehda,
              ),
              MyInputFaild(
                title: "الفرقة  ",
                hint: "أدخل اسم الفرقة",
                controller: _alfrka,
              ),
              MyInputFaild(
                title: "الرقم  ",
                hint: "أدخل الرقم ",
                controller: _alrakam,
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
                title: "نوع التدخل  ",
                hint: "أدخل نوع التدخل ",
                controller: _type,
              ),
              MyInputFaild(
                title: "نوع المركبة  ",
                hint: "أدخل نوع المركبة ",
                controller: _typecar,
              ),
              MyInputFaild(
                title: "وقت الخروج  ",
                hint: "أدخل وقت الخروج ",
                controller: _outtime,
              ),
              MyInputFaild(
                title: "وقت الوصول  ",
                hint: "أدخل وقت الوصول ",
                controller: _arrivedtime,
              ),
              MyInputFaild(
                title: "وقت انتهاء العملية  ",
                hint: "أدخل وقت انتهاء العملية ",
                controller: _finishtime,
              ),
              MyInputFaild(
                title: "وقت الدخول  ",
                hint: "أدخل وقت الدخول ",
                controller: _intime,
              ),
              MyInputFaild(
                title: "مكان التدخل  ",
                hint: "أدخل مكان التدخل ",
                controller: _place,
              ),
              MyInputFaild(
                title: "البلدية   ",
                hint: " ادخل البلدية   ",
                controller: _ba,
              ),
              MyInputFaild(
                title: "الدائرة   ",
                hint: "أدخل  الدائرة ",
                controller: _da,
              ),
              MyInputFaild(
                title: "طبيعة الحادث  ",
                hint: "أدخل طبيعة الحادث ",
                controller: _th,
              ),
              MyInputFaild(
                title: "اسباب الحادث  ",
                hint: "أدخل اسباب الحادث ",
                controller: _ah,
              ),
              MyInputFaild(
                title: "صنف الطريق  ",
                hint: "أدخل صنف الطريق ",
                controller: _st,
              ),
              MyInputFaild(
                title: "ر.ت المركبة  ",
                hint: "أدخل ر.ت المركبة ",
                controller: _rtm,
              ),
              Divider(
                thickness: 2,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "إضافة الضحايا",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              Text(
                " الضحية الاولى",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم الضحية ",
                controller: _name,
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب الضحية ",
                controller: _name2,
              ),
              MyInputFaild(
                title: " السن  ",
                hint: "أدخل سن الضحية ",
                controller: _age,
              ),
              MyInputFaild(
                title: "الجنس   ",
                hint: "أدخل جنس الضحية ",
                controller: _sex,
              ),
              MyInputFaild(
                title: "حالة الضحية  ",
                hint: "أدخل حالة الضحية ",
                controller: _hd,
              ),
        
              Divider(
                thickness: 1,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                " الضحية الثانية",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم الضحية ",
                controller: _nameb,
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب الضحية ",
                controller: _name2b,
              ),
              MyInputFaild(
                title: " السن  ",
                hint: "أدخل سن الضحية ",
                controller: _ageb,
              ),
              MyInputFaild(
                title: "الجنس   ",
                hint: "أدخل جنس الضحية ",
                controller: _sexb,
              ),
              MyInputFaild(
                title: "حالة الضحية  ",
                hint: "أدخل حالة الضحية ",
                controller: _hdb,
              ),
        
              Divider(
                thickness: 1,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                " الضحية الثالثة",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم الضحية ",
                controller: _namec,
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب الضحية ",
                controller: _name2c,
              ),
              MyInputFaild(
                title: " السن  ",
                hint: "أدخل سن الضحية ",
                controller: _agec,
              ),
              MyInputFaild(
                title: "الجنس   ",
                hint: "أدخل جنس الضحية ",
                controller: _sexc,
              ),
              MyInputFaild(
                title: "حالة الضحية  ",
                hint: "أدخل حالة الضحية ",
                controller: _hdc,
              ),
        
              Divider(
                thickness: 1,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                " الضحية الرابعة",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم الضحية ",
                controller: _named,
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب الضحية ",
                controller: _name2d,
              ),
              MyInputFaild(
                title: " السن  ",
                hint: "أدخل سن الضحية ",
                controller: _aged,
              ),
              MyInputFaild(
                title: "الجنس   ",
                hint: "أدخل جنس الضحية ",
                controller: _sexd,
              ),
              MyInputFaild(
                title: "حالة الضحية  ",
                hint: "أدخل حالة الضحية ",
                controller: _hdd,
              ),
        
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              MyInputFaild(
                title: "الاسعافات المقدمة   ",
                hint: "أدخل الاسعافات المقدمة ",
                controller: _im,
              ),
              MyInputFaild(
                title: "الخسائر المسجلة   ",
                hint: "أدخل الخسائر المسجلة ",
                controller: _khm,
              ),
              MyInputFaild(
                title: "الوسائل والعتاد المستعمل   ",
                hint: "أدخل الوسائل والعتاد المستعمل ",
                controller: _wam,
              ),
              MyInputFaild(
                title: "الأملاك المنقذة   ",
                hint: "أدخل الأملاك المنقذة ",
                controller: _am,
              ),
              MyInputFaild(
                title: "ملخص التدخل   ",
                hint: "أدخل ملخص التدخل ",
                controller: _mt,
              ),
              MyInputFaild(
                title: " الإجلاء   ",
                hint: "أدخل  الإجلاء ",
                controller: _i,
              ),
              MyInputFaild(
                title: "نقل الضحية الى   ",
                hint: "أدخل  المكان ",
                controller: _ndi,
              ),
              Divider(
                thickness: 2,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "إضافة المتدخلون",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
         
              CheckboxListTile(
                contentPadding: EdgeInsets.all(10),
                checkColor: AppColors.maincolor,
                activeColor: AppColors.textcolor,
                value: _t1,
                title: Text(
                  "تدخل أول ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onChanged: (val) {
                  setState(() {
                      _t1 = val!;
                  });
                },
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(10),
                checkColor: AppColors.maincolor,
                activeColor: AppColors.textcolor,
                value: _td,
                title: Text(
                  "تدخل الدعم ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onChanged: (val) {
                  setState(() {
                    _td = val!;
                  });
                },
              ),
                 Text(
                "  المتدخل الاول",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب  ",
                controller: _namet1,
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم  ",
                controller: _namet,
              ),
              MyInputFaild(
                  title: " المهنة  ",
                  hint: "أدخل  المهنة ",
                  controller: _workt),
              MyInputFaild(
                title: "الرتبة   ",
                hint: "أدخل  الرتبة ",
                controller: _rt,
              ),
           
              Divider(
                thickness: 1,
                height: 20,
                color: AppColors.textcolor,
              ),
                 Text(
                "  المتدخل الثاني",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب  ",
                controller: _namet1b,
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم  ",
                controller: _nametb,
              ),
              MyInputFaild(
                  title: " المهنة  ",
                  hint: "أدخل  المهنة ",
                  controller: _worktb),
              MyInputFaild(
                title: "الرتبة   ",
                hint: "أدخل  الرتبة ",
                controller: _rtb,
              ),
           
              Divider(
                thickness: 2,
                height: 20,
                color: AppColors.textcolor,
              ),
                 Text(
                "  المتدخل الثالث",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب  ",
                controller: _namet1c,
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم  ",
                controller: _nametc,
              ),
              MyInputFaild(
                  title: " المهنة  ",
                  hint: "أدخل  المهنة ",
                  controller: _worktc),
              MyInputFaild(
                title: "الرتبة   ",
                hint: "أدخل  الرتبة ",
                controller: _rtc,
              ),
           
              Divider(
                thickness: 2,
                height: 20,
                color: AppColors.textcolor,
              ),
                 Text(
                "  المتدخل الرابع",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " اللقب  ",
                hint: "أدخل لقب  ",
                controller: _namet1d,
              ),
              MyInputFaild(
                title: " الاسم  ",
                hint: "أدخل اسم  ",
                controller: _nametd,
              ),
              MyInputFaild(
                  title: " المهنة  ",
                  hint: "أدخل  المهنة ",
                  controller: _worktd),
              MyInputFaild(
                title: "الرتبة   ",
                hint: "أدخل  الرتبة ",
                controller: _rtd,
              ),
           
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "إضافة الحاضرون",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(10),
                checkColor: AppColors.maincolor,
                activeColor: AppColors.textcolor,
                value: _dw,
                title: Text(
                  "الدرك الوطني ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onChanged: (val) {
                  setState(() {
                    _dw = val!;
                  });
                },
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(10),
                checkColor: AppColors.maincolor,
                activeColor: AppColors.textcolor,
                value: _aw,
                title: Text(
                  "الأمن الوطني ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onChanged: (val) {
                  setState(() {
                    _aw = val!;
                  });
                },
              ),
              Divider(
                thickness: 2,
                height: 20,
                color: AppColors.textcolor,
              ),
              MyInputFaild(
                title: "رئيس العدد   ",
                hint: " ادخل اسم رئيس العدد ",
                controller: _ra,
              ),
              MyInputFaild(
                title: "ضابط منسق الاسعافات   ",
                hint: " ادخل اسم ضابط منسق الاسعافات ",
                controller: _dmi,
              ),
              MyInputFaild(
                title: "رئيس الوحدة   ",
                hint: " ادخل اسم رئيس الوحدة ",
                controller: _rw,
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة التقرير",
                      ontap: () async {
                        _validateData();
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
    if (_alwehda.text.isNotEmpty && _alrakam.text.isNotEmpty) {
      _addTaskToDB();
      Get.back();
    } else if (_alwehda.text.isEmpty || _alrakam.text.isEmpty) {
      Get.snackbar("ضروري", "كل الحقول ضرورية",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.warning_amber_rounded));
    }
  }

  _addTaskToDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("takrer");
    userref.add({
      "type": _type.text,
      "typecar": _typecar.text,
      "outtime": _outtime.text,
      "arrivedtime": _arrivedtime.text,
      "date": DateFormat.yMd().format(_selectedDate),
      "alwehda": _alwehda.text,
      "alfrka": _alfrka.text,
      "alrakam": _alrakam.text,
      "finishtime": _finishtime.text,
      "intime": _intime.text,
      "place": _place.text,
      "ba": _ba.text,
      "da": _da.text,
      "th": _th.text,
      "ah": _ah.text,
      "st": _st.text,
      "rtm": _rtm.text,
      "im": _im.text,
      "khm": _khm.text,
      "wam": _wam.text,
      "am": _am.text,
      "mt": _mt.text,
      "i": _i.text,
      "ndi": _ndi.text,
      "t1": _t1,
      "td": _td,
      "dw": _dw,
      "aw": _aw,
      "ra": _ra.text,
      "dmi": _dmi.text,
      "rw": _rw.text,
      
        "name": _name.text,
        "name2": _name2.text,
        "age": _age.text,
        "sex": _sex.text,
        "hd": _hd.text,
      
      
        "nameb": _nameb.text,
        "name2b": _name2b.text,
        "ageb": _ageb.text,
        "sexb": _sexb.text,
        "hdb": _hdb.text,
      
       
        "namec": _namec.text,
        "name2c": _name2c.text,
        "agec": _agec.text,
        "sexc": _sexc.text,
        "hdc": _hdc.text,
      
        
        "named": _named.text,
        "name2d": _name2d.text,
        "aged": _aged.text,
        "sexd": _sexd.text,
        "hdd": _hdd.text,
      
      
      
  
        "namet1":_namet1.text,
        "namet":_namet.text,
        "workt":_workt.text,
        "rt":_rt.text,
        "namet1b":_namet1b.text,
        "nametb":_nametb.text,
        "worktb":_worktb.text,
        "rtb":_rtb.text,
        "namet1c":_namet1c.text,
        "nametc":_nametc.text,
        "worktc":_worktc.text,
        "rtc":_rtc.text,
        "namet1d":_namet1d.text,
        "nametd":_nametd.text,
        "worktd":_worktd.text,
        "rtd":_rtd.text,
        
        
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
}
