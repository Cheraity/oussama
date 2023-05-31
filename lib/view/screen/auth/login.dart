import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/color.dart';
import 'package:memoire/controller/auth/login_controller.dart';
import 'package:memoire/core/functions/alertexitapp.dart';

import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';

import '../../widget/auth/customtextformauth.dart';

import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundcolor,
        elevation: 0.0,
        title: Text('Connexion', style: TextStyle(color: ColorApp.grey)),
      ),
      body: WillPopScope(
        onWillPop:  alertExitApp,
    child: GetBuilder<LoginControllerImp>(
    builder: (controller) =>
              Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const LogoAuth(),
              const SizedBox(height: 50) ,
              CustonTextFormAuth(
                isNumber: false ,
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                mycontroller: controller.email,
                hinttext: "Entrer Votre Email",
                iconData: Icons.email_outlined,
                labeltext: "Email",
                // mycontroller: ,
              ),
              CustonTextFormAuth(
                isNumber: false ,

                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "Entrer Votre Mot de passe ",
                iconData: Icons.lock_outline,
                labeltext: "Mot de passe",
                // mycontroller: ,
              ),
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: const Text(

                  "Mot de passe oublié",
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtomAuth(text: "SE CONNECTER", onPressed: () {controller.login();}),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Inscriver-vous gratuitement "),
                  InkWell(
                    onTap: (){
                      controller.goToSignUp();
                    },

                    child: Text("Inscription",
                        style: TextStyle(
                            color: ColorApp.titulaire,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ]),)
      ), )
      )
    );

  }
}