import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/core/constant/color.dart';
import '../../../controller/items_controller.dart';
import '../../../data/model/categoriesmodel.dart';
class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!);

      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3, color: ColorApp.titulaire),
                ),
              )
                  : null,
              child: Text(
                "${categoriesModel.categoriesName}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
