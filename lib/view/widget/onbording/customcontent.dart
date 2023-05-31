import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val) ;
        },
        itemCount: onBordingList.length,
        itemBuilder:(context,i)=>Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(onBordingList[i].image!,fit: BoxFit.fill,),
          Container(
            alignment: Alignment.center,
            child: Text(onBordingList[i].body!,textAlign: TextAlign.center,style: const TextStyle(height: 1.25,fontSize: 18,color: ColorApp.grey,fontWeight: FontWeight.bold)),
          )
        ]
    )
    );
  }
}