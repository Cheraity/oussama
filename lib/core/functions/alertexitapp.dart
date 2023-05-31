import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Quitter ikrilli ?",
      titleStyle:const  TextStyle(color: ColorApp.titulaire , fontWeight: FontWeight.bold),
  middleText: "Choisissez Annuler si vous souhaiter continuer ",
  actions: [
  ElevatedButton(
  style: ButtonStyle(
  backgroundColor:
  MaterialStateProperty.all(ColorApp.titulaire)),
  onPressed: () {
  exit(0);
  },
  child:const Text("Quitter")),
  ElevatedButton(
  style: ButtonStyle(
  backgroundColor:
  MaterialStateProperty.all(ColorApp.titulaire)),
  onPressed: () {
  Get.back();
  },
      child:const Text("Annuler"))
  ]);
  return Future.value(true);
}