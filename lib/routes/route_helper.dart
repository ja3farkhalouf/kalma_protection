import 'package:get/get.dart';
import 'package:kalma_protection/middleware/auth_middleware.dart';
import 'package:kalma_protection/views/homepage.dart';
import 'package:kalma_protection/views/loginpage.dart';
import 'package:kalma_protection/views/services/page1.dart';
import 'package:kalma_protection/views/services/page2.dart';
import 'package:kalma_protection/views/services/page3.dart';
import 'package:kalma_protection/views/services/page4.dart';
import 'package:kalma_protection/views/services/page5.dart';
import 'package:kalma_protection/views/services/page5_3.dart';
import 'package:kalma_protection/views/services/page6.dart';
import 'package:kalma_protection/views/services/page6_1.dart';

import '../views/services/page2_2.dart';
import '../views/services/page3_1.dart';
import '../views/services/page4_1.dart';
import '../views/services/page4_2.dart';
import '../views/services/page5_2.dart';
import '../views/services/page5_5.dart';
import '../views/services/page6_2.dart';
import '../views/services/page6_3.dart';
import '../views/services/page7.dart';
import '../views/services/page8.dart';
import '../views/splashSreen.dart';


class RouteHelper {

  static const String splashpage = "/splashpage";
  static const String initial = "/";
  static const String popularfood = "/popular-food";
  static const String recomendedfood = "/recomended_food";
  static const String cartpage = "/cart-page";
  static const String loginPage = "/Login-Page";
  static const String homePage = "/home-page";
  static const String page1 = "/page1";
  static const String page2 = "/page2";
  static const String page2_2 = "/page2_2";
  static const String page3 = "/page3";
  static const String page3_1 = "/page3_1";
  static const String page4 = "/page4";
  static const String page4_1 = "/page4_1";
  static const String page4_2 = "/page4_2";
  static const String page5 = "/page5";
  static const String page5_5 = "/page5_5";
  static const String page5_2 = "/page5_2";
  static const String page5_3 = "/page5_3";
  static const String page6 = "/page6";
  static const String page6_1 = "/page6_1";
  static const String page6_2 = "/page6_2";
  static const String page6_3 = "/page6_3";
  static const String page7 = "/page7";
  static const String page8 = "/page8";

  static String getSplashPage() => '$splashpage';
  static String getHomepage() => '$homePage';
  static String getInitial(String country_name,String lang) => '$initial?country_name=$country_name&lang=$lang';
  static String getPopularFood(int pageId, String page) =>
      '$popularfood?pageId=$pageId&page=$page';
  static String getRecomendedFood(int pageId,String page) =>
      '$recomendedfood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartpage';
  static String getLoginPage() => '$loginPage';
  static String getPage1() => '$page1';
  static String getPage2() => '$page2';
  static String getPage2_2() => '$page2_2';
  static String getPage3() => '$page3';
  static String getPage3_1() => '$page3_1';
  static String getPage4() => '$page4';
  static String getPage4_1() => '$page4_1';
  static String getPage4_2() => '$page4_2';
  static String getPage5() => '$page5';
  static String getPage5_5() => '$page5_5';
  static String getPage5_2() => '$page5_2';
  static String getPage5_3() => '$page5_3';
  static String getPage6() => '$page6';
  static String getPage6_1() => '$page6_1';
  static String getPage6_2() => '$page6_2';
  static String getPage6_3() => '$page6_3';
  static String getPage7() => '$page7';
  static String getPage8() => '$page8';

  static List<GetPage> routes = [
    GetPage(name: splashpage, page: () => SplashScreen()),
    
    GetPage(name: homePage, page: () => HomePage(),transition: Transition.fadeIn),
    GetPage(name: loginPage, page: () => LoginPage(),transition: Transition.fadeIn,middlewares: [AuthMiddleware()]),
    GetPage(name: page1, page: () => Page1(),transition: Transition.fadeIn),
    GetPage(name: page2, page: () => Page2(),transition: Transition.fadeIn),
    GetPage(name: page2_2, page: () => AddWorkPaper(),transition: Transition.fadeIn),
    GetPage(name: page3, page: () => Page3(),transition: Transition.fadeIn),
    GetPage(name: page3_1, page: () => HistoryTask(),transition: Transition.fadeIn),
    GetPage(name: page4, page: () => Page4(),transition: Transition.fadeIn),
    GetPage(name: page4_1, page: () => Addtakrer(),transition: Transition.fadeIn),
    GetPage(name: page4_2, page: () => HistoryUpdateTakrer(),transition: Transition.fadeIn),
    GetPage(name: page5, page: () => Page5(),transition: Transition.fadeIn),
    GetPage(name: page5_5, page: () => AddTaskPage(),transition: Transition.fadeIn),
    GetPage(name: page5_2, page: () => HistoryUpdateTask(),transition: Transition.fadeIn),
    GetPage(name: page5_3, page: () => UpdateTaskPage(),transition: Transition.fadeIn),
    GetPage(name: page6, page: () => Page6(),transition: Transition.fadeIn),
    GetPage(name: page6_1, page: () => AddNewUser(),transition: Transition.fadeIn),
    GetPage(name: page6_2, page: () => HistoryUpdateUser(),transition: Transition.fadeIn),
    GetPage(name: page6_3, page: () => UpdateUser(),transition: Transition.fadeIn),
    GetPage(name: page7, page: () => ShowWorkPaper(),transition: Transition.fadeIn),
    GetPage(name: page8, page: () => ViewTask(),transition: Transition.fadeIn),
    // GetPage(
    //     name: "/",
    //     page: () {
    //       var country_name = Get.parameters['country_name'];
    //       var lang = Get.parameters['lang'];
    //       return HomePage(country_name:country_name! ,lang:lang!);
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: recomendedfood,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return RecomendedFoodDetail(pageId: int.parse(pageId!),page:page!);
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: cartpage,
    //     page: () {
    //       return CartPage();
    //     },
    //     transition: Transition.fadeIn),
  ];
}