import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Invalide";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalide";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalide";
    }
  }

  if (val.isEmpty) {
    return "ne peut pas être vide";
  }

  if (val.length < min) {
    return "ne peut pas être inférieur à $min";
  }

  if (val.length > max) {
    return "ne peut pas être plus grand que $max";
  }
}