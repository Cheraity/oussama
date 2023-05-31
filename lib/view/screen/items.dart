import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memoire/controller/items_controller.dart';
import 'package:memoire/view/widget/items/customlistitems.dart';

import '../../controller/favorite_controller.dart';
import '../../data/model/logmentmodel.dart';
import '../widget/customappBar.dart';
import '../widget/items/listcategoirseitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              //CustomAppBar(
                //titleappbar: "où allez-vous",
                //onPressedIcon: () {},
                //onPressedSearch: () {},
              //),
              const SizedBox(height: 20),
              const ListCategoriesItems(),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, index) {
                  controllerFav.isFavorite[controller.data[index]
                  ['logment_id']] = controller.data[index]['favorite'];

                  return CustomListItems(
                    active: true,
                    itemsModel: LogementModel.fromJson(controller.data[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

