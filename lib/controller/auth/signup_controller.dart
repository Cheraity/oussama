import 'package:memoire/core/constant/linkapi.dart';
import 'package:memoire/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/auth/crud.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  signUp() async {
    Crud crud=Crud();
    if(formstate.currentState!.validate()) {
      var response = await crud.postRequest(AppLink.linkSignUp, {
        "username": username.text,
        "email": email.text,
        "phone": phone.text,
        "password": password.text,

      });
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);

      }
      else {
        print("Erreur");
      }
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}