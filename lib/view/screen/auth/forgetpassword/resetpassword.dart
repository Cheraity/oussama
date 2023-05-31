import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memoire/core/constant/color.dart';

import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundcolor,
        elevation: 0.0,
        title: const Text('ResetPassword',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "New Password"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
              "Please Enter new Password"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            isNumber: false ,
            valid: (val) {
              return validInput(val!, 3, 40, "password");
            },

            mycontroller: controller.password,
            hinttext: "Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
            // mycontroller: ,
          ),   CustonTextFormAuth(
              isNumber: false ,
              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },

            mycontroller: controller.password,
            hinttext: "Re Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "save", onPressed: () {controller.goToSuccessResetPassword() ; }),
          const SizedBox(height: 40),
        ]),

          )
      ),
    );
  }
}