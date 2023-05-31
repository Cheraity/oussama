import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/color.dart';
import 'package:memoire/core/functions/alertexitapp.dart';

import '../../../controller/auth/signup_controller.dart';

import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';

import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/logoauth2.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundcolor,
        elevation: 0.0,
        title: Text('Inscription',style: TextStyle(color:ColorApp.grey)),
      ),
      body: WillPopScope( onWillPop: alertExitApp,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const SizedBox(height: 20),
              const LogoAutho(),
              const SizedBox(height: 50) ,

              CustonTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 20, "username");
                },
                mycontroller: controller.username,
                hinttext: "Nom d'utilisateur",
                iconData: Icons.person_outline,
                labeltext: "Nom d'utilisateur",
                // mycontroller: ,
              ),
              CustonTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "email");
                },
                mycontroller: controller.email,
                hinttext: " Email",
                iconData: Icons.email_outlined,
                labeltext: "Email",
                // mycontroller: ,
              ),
              CustonTextFormAuth(
                isNumber: true,
                valid: (val) {
                  return validInput(val!, 10, 10, "phone");
                },
                mycontroller: controller.phone,
                hinttext: "N°Telephone",
                iconData: Icons.phone_android_outlined,
                labeltext: " N°Telephone",
                // mycontroller: ,
              ),
              CustonTextFormAuth(
                isNumber: false,

                valid: (val) {
                  return validInput(val!,5, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: " Mot de passe",
                iconData: Icons.lock_outline,
                labeltext: "Mot de passe",
                // mycontroller: ,
              ),
              CustomButtomAuth(text: "S'INSCRIRE", onPressed: () {controller.signUp(); }),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textone: " Avez-vous déja un compte ? ",
                texttwo: " Se Connecter ",
                onTap: () {
                  controller.goToSignIn();
                },
              ),
            ]),
          )
      ),
      )
    );
  }
}