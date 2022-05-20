import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utiles/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/input_faild.dart';

class AddWorkPaper extends StatefulWidget {
  AddWorkPaper({Key? key}) : super(key: key);

  @override
  State<AddWorkPaper> createState() => _AddWorkPaperState();
}

class _AddWorkPaperState extends State<AddWorkPaper> {
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _racontroller = TextEditingController();
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _fcontroller = TextEditingController();
  final TextEditingController _kfcontroller = TextEditingController();
  final TextEditingController _nkfcontroller = TextEditingController();
  final TextEditingController _k66controller = TextEditingController();
  final TextEditingController _deltacontroller = TextEditingController();
  final TextEditingController _naa1 = TextEditingController();
  final TextEditingController _naa2 = TextEditingController();
  final TextEditingController _mata1 = TextEditingController();
  final TextEditingController _mata2 = TextEditingController();
  final TextEditingController _makh1 = TextEditingController();
  final TextEditingController _makh2 = TextEditingController();
  //سيارات الاسعاف
  int index = 1;
  final TextEditingController _raissaf = TextEditingController();
  final TextEditingController _sissaf = TextEditingController();
  final TextEditingController _a1issaf = TextEditingController();
  final TextEditingController _a2issaf = TextEditingController();
  final TextEditingController _tissaf = TextEditingController();
//شاحنة اول نجدة
  int indexsh1n = 1;
  final TextEditingController _rash1n = TextEditingController();
  final TextEditingController _msh1n = TextEditingController();
  final TextEditingController _ssh1n = TextEditingController();
  final TextEditingController _a1sh1n = TextEditingController();
  final TextEditingController _a2sh1n = TextEditingController();
  final TextEditingController _a3sh1n = TextEditingController();
  final TextEditingController _typesh1n = TextEditingController();
//شاحنة حرائق الغابات
  int indexshhg = 1;
  final TextEditingController _rashhg = TextEditingController();
  final TextEditingController _sshhg = TextEditingController();
  final TextEditingController _a1shhg = TextEditingController();
  final TextEditingController _a2shhg = TextEditingController();
  final TextEditingController _typeshhg = TextEditingController();
//شاحنات صهريج المياه
  int indexshsm = 1;
  final TextEditingController _rashsm = TextEditingController();
  final TextEditingController _sshsm = TextEditingController();
  final TextEditingController _ashsm = TextEditingController();
  final TextEditingController _typeshsm = TextEditingController();
  //شاحنة السلم الميكانيكي
  final TextEditingController _rashsmk = TextEditingController();
  final TextEditingController _sshsmk = TextEditingController();
  final TextEditingController _ashsmk = TextEditingController();
  //vcr+ctm
  final TextEditingController _ravcrctm = TextEditingController();
  final TextEditingController _svcrctm = TextEditingController();
  final TextEditingController _avcrctm = TextEditingController();
  //الاجازات
  final TextEditingController _e1 = TextEditingController();
  final TextEditingController _e2 = TextEditingController();
  final TextEditingController _e3 = TextEditingController();
  final TextEditingController _e4 = TextEditingController();
  //الغطاسين

  final TextEditingController _s1gat = TextEditingController();
  final TextEditingController _s2gat = TextEditingController();
  final TextEditingController _s3gat = TextEditingController();
  final TextEditingController _s4gat = TextEditingController();
  final TextEditingController _szgat = TextEditingController();
  //مراكز الحراسة
  final TextEditingController _amh = TextEditingController();
  final TextEditingController _arefmh = TextEditingController();
  final TextEditingController _timemh = TextEditingController();
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
                "إضافة ورقة المهام اليومية",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor),
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
                title: "رقيب يومي",
                hint: "أدخل اسم الرقيب",
                controller: _racontroller,
              ),
              MyInputFaild(
                title: " العريف اليومي ",
                hint: "أدخل اسم العريف",
                controller: _acontroller,
              ),
              MyInputFaild(
                title: " الفصيلة ",
                hint: "أدخل الفصيلة ",
                controller: _fcontroller,
              ),
              MyInputFaild(
                title: "قائد الفصيلة  ",
                hint: "ادخل اسم قائد الفصيلة",
                controller: _kfcontroller,
              ),
              MyInputFaild(
                title: "نائب قائد الفصيلة  ",
                hint: "ادخل اسم نائب قائد الفصيلة",
                controller: _nkfcontroller,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  سيارات الاسعاف",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              Text(
                "  ملاحظة ادخل الواحدة تلوى الاخرى واضغط على زر اضافة ",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _raissaf,
              ),
              MyInputFaild(
                title: " السائق ",
                hint: "أدخل اسم السائق ",
                controller: _sissaf,
              ),
              MyInputFaild(
                title: " العون الاول  ",
                hint: "ادخل اسم العون الاول",
                controller: _a1issaf,
              ),
              MyInputFaild(
                title: " العون الثاني  ",
                hint: "ادخل اسم  العون الثاني",
                controller: _a2issaf,
              ),
              MyInputFaild(
                title: "  الطبيب  ",
                hint: "ادخل اسم  الطبيب ان وجد",
                controller: _tissaf,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtaskissaftoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  شاحنات اول نجدة",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              Text(
                "   ملاحظة ادخل الواحدة تلوى الاخرى واضغط على زر اضافة ",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: "  النوع  ",
                hint: "أدخل  نوع الشاحنة",
                controller: _typesh1n,
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _rash1n,
              ),
              MyInputFaild(
                title: "  المصور  ",
                hint: "أدخل اسم المصور ",
                controller: _msh1n,
              ),
              MyInputFaild(
                title: " السائق ",
                hint: "أدخل اسم السائق ",
                controller: _ssh1n,
              ),
              MyInputFaild(
                title: " العون الاول  ",
                hint: "ادخل اسم العون الاول",
                controller: _a1sh1n,
              ),
              MyInputFaild(
                title: " العون الثاني  ",
                hint: "ادخل اسم  العون الثاني",
                controller: _a2sh1n,
              ),
              MyInputFaild(
                title: "  العون الثالث  ",
                hint: "ادخل اسم  العون الثالث ",
                controller: _a3sh1n,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtaskssh1ntoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  شاحنات حرائق الغابات ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              Text(
                "   ملاحظة ادخل الواحدة تلوى الاخرى واضغط على زر اضافة ",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: "  النوع  ",
                hint: "أدخل  نوع الشاحنة",
                controller: _typeshhg,
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _rashhg,
              ),
              MyInputFaild(
                title: " السائق ",
                hint: "أدخل اسم السائق ",
                controller: _sshhg,
              ),
              MyInputFaild(
                title: " العون الاول  ",
                hint: "ادخل اسم العون الاول",
                controller: _a1shhg,
              ),
              MyInputFaild(
                title: " العون الثاني  ",
                hint: "ادخل اسم  العون الثاني",
                controller: _a2shhg,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksshhgtoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  شاحنات صهريج مياه ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              Text(
                "   ملاحظة ادخل الواحدة تلوى الاخرى واضغط على زر اضافة ",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: "  النوع  ",
                hint: "أدخل  نوع الشاحنة",
                controller: _typeshsm,
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _rashsm,
              ),
              MyInputFaild(
                title: "  السائق  ",
                hint: "أدخل اسم السائق ",
                controller: _sshsm,
              ),
              MyInputFaild(
                title: " العون   ",
                hint: "ادخل اسم العون ",
                controller: _ashsm,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksshsmtoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  شاحنات السلم الميكانيكي ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _rashsmk,
              ),
              MyInputFaild(
                title: "  السائق  ",
                hint: "أدخل اسم السائق ",
                controller: _sshsmk,
              ),
              MyInputFaild(
                title: " العون   ",
                hint: "ادخل اسم العون ",
                controller: _ashsmk,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksshsmktoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              MyInputFaild(
                title: " شاحنة k66   ",
                hint: "ادخل اسم السائق ",
                controller: _k66controller,
              ),
              MyInputFaild(
                title: " شاحنة Delta   ",
                hint: "ادخل اسم السائق ",
                controller: _deltacontroller,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  شاحنات  vcr+ctm ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " رئيس العدد  ",
                hint: "أدخل اسم رئيس العدد",
                controller: _ravcrctm,
              ),
              MyInputFaild(
                title: "  السائق  ",
                hint: "أدخل اسم السائق ",
                controller: _svcrctm,
              ),
              MyInputFaild(
                title: " العون   ",
                hint: "ادخل اسم العون ",
                controller: _avcrctm,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksvsrctmtoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  الاجازات   ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الاجازة الاولى  ",
                hint: "أدخل   الاجازة الاولى",
                controller: _e1,
              ),
              MyInputFaild(
                title: "  الاجازة الثانية  ",
                hint: "أدخل الاجازة الثانية ",
                controller: _e2,
              ),
              MyInputFaild(
                title: " الاجازة الثالثة   ",
                hint: "ادخل الاجازة الثالثة ",
                controller: _e3,
              ),
              MyInputFaild(
                title: " الاجازة الرابعة   ",
                hint: "ادخل الاجازة الرابعة ",
                controller: _e4,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksegazatoDB();
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "   المخزن  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " العون الاول    ",
                hint: "أدخل اسم العون  ",
                controller: _makh1,
              ),
              MyInputFaild(
                title: " العون الثاني   ",
                hint: "أدخل اسم العون ",
                controller: _makh2,
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "   النادي  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " العون الاول    ",
                hint: "أدخل اسم العون  ",
                controller: _naa1,
              ),
              MyInputFaild(
                title: " العون الثاني   ",
                hint: "أدخل اسم العون ",
                controller: _naa2,
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "   المطبخ  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                  title: " العون الاول    ",
                  hint: "أدخل اسم العون  ",
                  controller: _mata1),
              MyInputFaild(
                title: " العون الثاني   ",
                hint: "أدخل اسم العون ",
                controller: _mata2,
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  الغطاسين  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " الغطاس الاول  ",
                hint: "أدخل اسم الغطاس ",
                controller: _s1gat,
              ),
              MyInputFaild(
                title: "  الغطاس الثاني  ",
                hint: "أدخل اسم الغطاس ",
                controller: _s2gat,
              ),
              MyInputFaild(
                title: " الغطاس الثالث   ",
                hint: "ادخل اسم الغطاس ",
                controller: _s3gat,
              ),
              MyInputFaild(
                title: " الغطاس الرابع   ",
                hint: "ادخل اسم الغطاس ",
                controller: _s4gat,
              ),
              MyInputFaild(
                title: " سائق الزورق   ",
                hint: "ادخل اسم سائق الزورق ",
                controller: _szgat,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksgattoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "إضافة  مراكز الحراسة  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor),
              ),
              MyInputFaild(
                title: " وقت الحراسة   ",
                hint: "أدخل وقت الحراسة ",
                controller: _timemh,
              ),
              MyInputFaild(
                title: " العريف   ",
                hint: "أدخل اسم العريف ",
                controller: _arefmh,
              ),
              MyInputFaild(
                title: "   العون  ",
                hint: "أدخل اسم العون ",
                controller: _amh,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة",
                      ontap: () async {
                        _addtasksmhtoDB();
                      })
                ],
              ),
              Divider(
                height: 20,
                thickness: 3,
                color: AppColors.textcolor,
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "إضافة ورقة مهام",
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
    if (_racontroller.text.isNotEmpty && _acontroller.text.isNotEmpty) {
      _addTaskToDB();
      Get.back();
    } else if (_racontroller.text.isEmpty || _acontroller.text.isEmpty) {
      Get.snackbar("ضروري", "كل الحقول ضرورية",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: AppColors.textcolor,
          icon: Icon(Icons.warning_amber_rounded));
    }
  }

  _addTaskToDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").set({
      "a": _acontroller.text,
      "r": _racontroller.text,
      "f": _fcontroller.text,
      "kf": _kfcontroller.text,
      "date": DateFormat.yMd().format(_selectedDate),
      "nkf": _nkfcontroller.text,
      "k66": _k66controller.text,
      "delta": _deltacontroller.text,
      "makha1": _makh1.text,
      "makha2": _makh2.text,
      "mata1": _mata1.text,
      "mata2": _mata2.text,
      "naa1": _naa1.text,
      "naa2": _naa2.text,
    }).then((value) {
      print("sucsess");
       Get.snackbar("حسنا", "تم  اضافة ورقة المهام بنجاح",
          titleText: Text(
            "حسنا",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: AppColors.maincolor, fontWeight: FontWeight.w900),
          ),
          messageText: Text(
            "تم اضافة ورقة المهام بنجاح",
            textAlign: TextAlign.right,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color.fromARGB(255, 17, 19, 62));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtaskissaftoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("isaaf").doc(index.toString()).set({
      "ra": _raissaf.text,
      "a1": _a1issaf.text,
      "s": _sissaf.text,
      "a2": _a2issaf.text,
      "t": _tissaf.text,
    }).then((value) {
      print("sucsess");

      index = index + 1;
      Get.snackbar("اضافة سيارة اسعاف", " تم اضافة سيارة اسعاف   ",
          titleText: Text(
            "اضافة سيارة اسعاف",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة سيارة اسعاف",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtaskssh1ntoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("sh1n").doc(indexsh1n.toString()).set({
      "ra": _rash1n.text,
      "m": _msh1n.text,
      "s": _ssh1n.text,
      "a1": _a1sh1n.text,
      "a2": _a2sh1n.text,
      "a3": _a3sh1n.text,
      "type": _typesh1n.text,
    }).then((value) {
      print("sucsess");

      indexsh1n = indexsh1n + 1;
      Get.snackbar("اضافة شاحنة اول نجدة ", " تم اضافة شاحنة اول نجدة    ",
          titleText: Text(
            "اضافة شاحنة اول نجدة",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة شاحنة اول نجدة",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksshhgtoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("shhg").doc(indexsh1n.toString()).set({
      "ra": _rashhg.text,
      "s": _sshhg.text,
      "a1": _a1shhg.text,
      "a2": _a2shhg.text,
      "type": _typeshhg.text,
    }).then((value) {
      print("sucsess");

      indexsh1n = indexsh1n + 1;
      Get.snackbar(
          "اضافة شاحنة حرائق غابات ", " تم اضافة شاحنة حرائق غابات    ",
          titleText: Text(
            "اضافة شاحنة حرائق غابات",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة شاحنة حرائق غابات",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksshsmtoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("shsm").doc(indexshsm.toString()).set({
      "ra": _rashsm.text,
      "s": _sshsm.text,
      "a": _ashsm.text,
      "type": _typeshsm.text,
    }).then((value) {
      print("sucsess");

      indexshsm = indexshsm + 1;
      Get.snackbar("اضافة شاحنة صهريج مياه ", " تم اضافة شاحنة صهريج مياه    ",
          titleText: Text(
            "اضافة شاحنة صهريج مياه",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة شاحنة صهريج مياه",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksshsmktoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("shsmk").doc("1").set({
      "ra": _rashsmk.text,
      "s": _sshsmk.text,
      "a": _ashsmk.text,
    }).then((value) {
      print("sucsess");

      Get.snackbar("اضافة شاحنة السلم الميكانيكي ",
          " تم اضافة شاحنة السلم الميكانيكي    ",
          titleText: Text(
            "اضافة شاحنة السلم الميكانيكي",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة شاحنة السلم الميكانيكي",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksvsrctmtoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("vsr+ctm").doc("1").set({
      "ra": _ravcrctm.text,
      "s": _svcrctm.text,
      "a": _avcrctm.text,
    }).then((value) {
      print("sucsess");

      Get.snackbar("اضافة  vsr+ctm ", " تم اضافة vsrctm    ",
          titleText: Text(
            "اضافة vsrctm  ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة vsrctm",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksegazatoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("egaza").doc("1").set({
      "e1": _e1.text,
      "e2": _e2.text,
      "e3": _e3.text,
      "e4": _e4.text,
    }).then((value) {
      print("sucsess");

      Get.snackbar("اضافة  الاجازات ", " تم اضافة الاجازات    ",
          titleText: Text(
            "اضافة الاجازات  ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة الاجازات",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksgattoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("gat").doc("1").set({
      "s1": _s1gat.text,
      "s2": _s2gat.text,
      "s3": _s3gat.text,
      "s4": _s4gat.text,
      "sz": _szgat.text,
    }).then((value) {
      print("sucsess");

      Get.snackbar("اضافة  الغطاسين ", " تم اضافة الغطاسين    ",
          titleText: Text(
            "اضافة الغطاسين  ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة الغطاسين",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
    }).catchError((e) {
      print("error : $e");
    });
  }

  _addtasksmhtoDB() async {
    CollectionReference userref =
        await FirebaseFirestore.instance.collection("workpaper");
    userref.doc("1").collection("mh").doc("1").set({
      "time": _timemh.text,
      "aref": _arefmh.text,
      "a": _amh.text,
    }).then((value) {
      print("sucsess");

      Get.snackbar("اضافة  مركز الحراسة ", " تم اضافة مركز الحراسة    ",
          titleText: Text(
            "اضافة مركز الحراسة  ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            "   تم اضافة مركز الحراسة",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.warning_amber_rounded),
          backgroundColor: Color.fromARGB(255, 9, 157, 139));
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
