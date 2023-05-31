
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:memoire/view/screen/auth/login.dart';
import 'package:memoire/view/screen/auth/signup.dart';
import 'package:memoire/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:memoire/view/screen/auth/success_signup.dart';

import 'package:memoire/view/screen/homescreen.dart';
import 'package:memoire/view/screen/items.dart';
import 'package:memoire/view/screen/onbording.dart';
import 'package:memoire/view/screen/productdetails.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [

GetPage(name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page:() => const Login()),
  GetPage(name: AppRoute.home, page:() => HomeScreen()),
  GetPage(name: AppRoute.signUp, page:() => SignUp()),
  GetPage(name: AppRoute.onBoarding, page:() => OnBoarding() ),
  GetPage(name:  AppRoute.successResetpassword, page:() => SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page:() => SuccessSignUp()),
  GetPage(name: AppRoute.items, page:() => Items()),
  GetPage(name: AppRoute.productdetails, page:() => ProductDetails()),

];
