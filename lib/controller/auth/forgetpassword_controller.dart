
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  @override
  checkemail() {}

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      print("Invalide");
    }
  }

  @override

    void onInit() {
      email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}