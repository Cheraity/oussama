import 'package:get/get.dart';


import '../data/model/logmentmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late LogementModel itemsModel;

  void intialData() {

    itemsModel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
