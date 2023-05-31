import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/routes.dart';
import 'package:memoire/view/screen/homescreen.dart';

import 'package:memoire/view/screen/onbording.dart';
import 'package:memoire/view/screen/productdetails.dart';
import 'bindings/intialbindings.dart';
import 'core/services/services.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoarding(),


      //HomeScreen(),

      //routes: routes,
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
