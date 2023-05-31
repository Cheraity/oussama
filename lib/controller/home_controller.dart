import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';

import 'package:get/get.dart';

import '../data/model/logmentmodel.dart';

abstract class  HomeController extends GetxController {

  goToItems(List categories, int selectedCat, String categoryid);

  getdata() ;

}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
   List<LogementModel>  listdata =[];
   StatusRequest? statusRequest;
  String? username;
  String? id;
  TextEditingController? search;
  bool isSearch=false;
  HomeData homedata = HomeData(Get.find());
  checkSearch(val){
    if(val==""){
      isSearch=false;
    }
    update();
  }
  onSearchItems(){
    isSearch=true;
    serachdata();
    update();
  }
  // List data = [];
  List categories = [];
   List logment = [];
  @override
  initialData() {

    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }


  @override
  void onInit() {
    search=TextEditingController();
    getdata() ;
    initialData();
    super.onInit();
  }


  @override
  getdata() async {
    statusRequest=StatusRequest.loading;

    var response = await homedata.getData();
    print("=================Controller $response");


      if (response['status'] == "success") {

        categories.addAll(response['categories']);
        logment.addAll(response['logment']);
      } else {
        print("sadma ou say");
      }

    update();
  }
  serachdata() async {
    statusRequest=StatusRequest.loading;

    var response = await homedata.searchData(search!.text);
    print("=================Controller $response");

    if (response['status'] == "success") {
      listdata.clear();
      List responsedata=response['data'];
      listdata.addAll(responsedata.map((e) => LogementModel.fromJson(e)));

    } else {
      print("sadma ou say");
    }

    update();
  }
   @override
   goToItems(List categories, int selectedCat, categoryid) {
     Get.toNamed(AppRoute.items,
         arguments: {"categories": categories, "selectedcat": selectedCat,"catid": categoryid});
   }
  goTopageProductDetails(itemsModel){
    Get.toNamed("productdetails",arguments: {"itemsmodel":itemsModel});

  }
}

