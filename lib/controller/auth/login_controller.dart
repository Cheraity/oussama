import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/routes.dart';
import 'package:memoire/core/services/services.dart';
import 'package:memoire/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  void login();
  void goToSignUp();
  void goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());

  void showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void login() async {
    if (formstate.currentState!.validate()) {
      update();
      try {
        var response = await loginData.postdata(email.text, password.text);

        if (response['status'] == "success") {
          var userData = response['data'][0];
          myServices.sharedPreferences.setString("id", userData['users_id'].toString());
          myServices.sharedPreferences.setString("username", userData['users_name'].toString());
          myServices.sharedPreferences.setString("email", userData['users_email'].toString());
          myServices.sharedPreferences.setString("phone", userData['users_phone'].toString());
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.home);
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or Password Not Correct",
          );
        }
      } catch (e) {
        print('Erreur lors de la connexion : $e');
        // Gestion de l'erreur
      }

      update();
    }
  }
}
