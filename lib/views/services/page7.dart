import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/utiles/colors.dart';

class ShowWorkPaper extends StatefulWidget {
  ShowWorkPaper({Key? key}) : super(key: key);

  @override
  State<ShowWorkPaper> createState() => _ShowWorkPaperState();
}

class _ShowWorkPaperState extends State<ShowWorkPaper> {
  String date = "";
  String a = "";
  String delta = "";
  String f = "";
  String kf = "";
  String nkf = "";
  String r = "";
  String k66 = "";
  List main = [];

  getwork() async {
    DocumentReference<Map<String, dynamic>> workref =
        FirebaseFirestore.instance.collection("workpaper").doc("1");
    workref.get().then((value) {
      main.add(value.data());
      date = value.data()!['date'];
      r = value.data()!['r'];
      a = value.data()!['a'];
      delta = value.data()!['delta'];
      f = value.data()!['f'];
      kf = value.data()!['kf'];
      nkf = value.data()!['nkf'];
      k66 = value.data()!['k66'];
    });
  }

  List issafdoc = [];
  List sh1n = [];
  List shhg = [];
  List shsm = [];
  List shsmk = [];
  List vsrctm = [];
  List gat = [];
  List mh = [];
  List egaza = [];
  gettaskissaf() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("isaaf");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        issafdoc.add(element.data());
      });
    });
  }

  gettasksh1n() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("sh1n");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        sh1n.add(element.data());
      });
    });
  }

  gettaskshhg() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("shhg");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        shhg.add(element.data());
      });
    });
  }

  gettaskshsm() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("shsm");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        shsm.add(element.data());
      });
    });
  }

  gettaskshsmk() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("shsmk");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        shsmk.add(element.data());
      });
    });
  }

  gettasksvsrctm() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("vsr+ctm");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        vsrctm.add(element.data());
      });
    });
  }

  gettaskgat() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("gat");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        gat.add(element.data());
      });
    });
  }

  gettaskmh() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("mh");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        mh.add(element.data());
      });
    });
  }
  gettasksegaza() async {
    CollectionReference taskref = FirebaseFirestore.instance
        .collection("workpaper")
        .doc("1")
        .collection("egaza");
    var responsebody = await taskref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        egaza.add(element.data());
      });
    });
  }

  @override
  void initState() {
    gettaskissaf();
    getwork();
    gettasksh1n();
    gettaskshhg();
    gettaskshsm();
    gettaskshsmk();
    gettasksvsrctm();
    gettasksegaza();
    gettaskgat();
    gettaskmh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
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
              Text(" ???????????????? ?????????????? ????????  : $date",
                  style: TextStyle(
                    color: AppColors.maincolor,
                    fontWeight: FontWeight.w900,
                  )),
              Divider(
                thickness: 3,
                color: AppColors.textcolor,
              ),
              Text(
                "???????????? ????????????   : ${r}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "???????????? ????????????   : ${a}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 3,
                color: AppColors.textcolor,
              ),
              Text(
                "??????????????   :${f}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "???????? ??????????????   : ${kf}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " ???????? ???????? ??????????????  :${nkf}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "   ???????????? ??????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: issafdoc.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                " ????????  ??????????  :${issafdoc[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${issafdoc[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${issafdoc[i]['a1']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${issafdoc[i]['a2']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${issafdoc[i]['t']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "  ?????????? ?????? ????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: sh1n.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                "   ??????????  :${sh1n[i]['type']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????  ??????????  :${sh1n[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${sh1n[i]['m']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${sh1n[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${sh1n[i]['a1']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${sh1n[i]['a2']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${sh1n[i]['a3']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "   ?????????? ?????????? ??????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: shhg.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                "   ??????????  :${shhg[i]['type']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????  ??????????  :${shhg[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${shhg[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${shhg[i]['a1']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${shhg[i]['a2']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "   ?????????? ?????????? ????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: shsm.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                "   ??????????  :${shsm[i]['type']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????  ??????????  :${shsm[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${shsm[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${shsm[i]['a']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "   ?????????? ?????????? ????????????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: shsmk.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                " ????????  ??????????  :${shsmk[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${shsmk[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${shsmk[i]['a']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                color: AppColors.textcolor,
              ),
              Text(
                "???????? ?????????? k66   : ${k66}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 3,
                color: AppColors.textcolor,
              ),
              Text(
                "???????? ?????????? DELTA   : ${delta}",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                " VSR+CTM",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: vsrctm.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                " ????????  ??????????  :${vsrctm[i]['ra']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${vsrctm[i]['s']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${vsrctm[i]['a']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "  ????????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: egaza.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                "    ?????????????? ????????????   :${egaza[i]['e1']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "    ?????????????? ??????????????  :${egaza[i]['e2']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "   ?????????????? ??????????????  :${egaza[i]['e3']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ?????????????? ??????????????    :${egaza[i]['e4']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            
                            
                            ],
                          ));
                    }),
              ),
              //===========================================================
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                "  ????????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: gat.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                "    ???????? ????????????  :${gat[i]['sz']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "   ???????????? 1  :${gat[i]['s1']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "   ???????????? 2  :${gat[i]['s2']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ???????????? 3    :${gat[i]['s3']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ???????????? 4    :${gat[i]['s4']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
              Divider(
                thickness: 3,
                height: 20,
                color: AppColors.textcolor,
              ),
              Text(
                " ???????? ??????????????",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: mh.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                              Text(
                                " ??????  ??????????????  :${mh[i]['time']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ????????????    :${mh[i]['aref']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                " ??????????    :${mh[i]['a']}",
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_appBar() {
  return AppBar(
    title: Text(
      "???????? ???????????????? ??????????????  ",
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
