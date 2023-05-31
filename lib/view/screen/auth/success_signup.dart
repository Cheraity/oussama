import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memoire/core/constant/color.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
    Get.put(SuccessSignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundcolor,
        elevation: 0.0,
        title: Text('Success',style: TextStyle(color: ColorApp.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ColorApp.titulaire,
              )),
          Text("...."),
          Text("...."),
          Spacer() ,
          Container(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "Go To Login",
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          SizedBox(height: 30)
        ]),
      ),
    );
  }
}