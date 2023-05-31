import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:memoire/core/class/statusrequest.dart';
import 'package:memoire/core/constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(ImageAssets.loading , width: 250 , height: 250))
        : widget;


  }
}