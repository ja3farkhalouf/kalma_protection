import 'package:flutter/material.dart';

import '../utiles/colors.dart';
import '../utiles/dimention.dart';


class ResponseveButton extends StatelessWidget {
  bool? isResponseve;
  double? width;
  String name;
  ResponseveButton({Key? key, this.isResponseve = false, this.width=200,required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: Dimention.screenwidth / 1.3,
       height: Dimention.screenheigth / 19,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: AppColors.maincolor),
      child: Center(child: Text(name,style: TextStyle(color: AppColors.textcolor,fontWeight: FontWeight.w900),)),
    );
  }
}
