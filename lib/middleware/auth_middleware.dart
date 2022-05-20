import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalma_protection/main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedpref!.getString("role")== "1"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page1") ;
    if (sharedpref!.getString("role")== "2"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page2") ;
    if (sharedpref!.getString("role")== "3"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page3") ;
    if (sharedpref!.getString("role")== "4"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page4") ;
    if (sharedpref!.getString("role")== "5"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page5") ;
    if (sharedpref!.getString("role")== "6"&&sharedpref!.getString("login")=="yes") return RouteSettings(name: "/page6") ;
  }
}
