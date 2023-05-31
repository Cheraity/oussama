
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/color.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../widget/auth/custombuttonauth.dart';

import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.grey,
        elevation: 0.0,
        title: const Text('Récupération de compte ',
           ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(child: ListView(children: [
        const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Récupération de votre  compte "),

          const SizedBox(height: 35),
          CustonTextFormAuth(
            isNumber: false,
            valid: (val) {},
            mycontroller: controller.email,
            hinttext: "Entrer Votre Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "Envoyer", onPressed: () {controller.goToVerfiyCode() ; }),
          const SizedBox(height: 40),
          ]),),

      ),
    );
  }
}