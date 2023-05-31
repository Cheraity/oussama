import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memoire/data/model/logmentmodel.dart';
import '../core/class/statusrequest.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val);
  getItems(String categoryid);
  goTopageProductDetails(LogementModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  late String? catid;
  int? selectedCat;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
  @override
  void intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);

  }
  @override
  void changeCat(val) {
    selectedCat = val;


    update();
  }

  @override
  Future<void> getItems(categoryid) async{


    statusRequest = StatusRequest.loading;

    var response = await testData.getData(categoryid,myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");

      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    @override
   goTopageProductDetails(itemsModel){
    Get.toNamed("productdetails",arguments: {"itemsmodel":itemsModel});

    }

  }
