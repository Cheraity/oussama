import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add)),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        ));
  }
}