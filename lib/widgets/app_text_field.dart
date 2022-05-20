import 'package:flutter/material.dart';

import '../utiles/colors.dart';
import '../utiles/dimention.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  bool isObscure;

      AppTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.icon,
      this.isObscure=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimention.screenwidth / 1.3,
      height: Dimention.screenheigth / 22,
      
      decoration: BoxDecoration(
        
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(1, 5),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Container(
       
        child: TextField(
          showCursor: true,
          textAlign: TextAlign.end,
          obscureText: isObscure?true:false,
          controller: textController,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 10
              ),
              prefixIcon: Icon(icon, color: AppColors.maincolor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 1.0, color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 1.0, color: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              )),
        ),
      ),
    );
  }
}
