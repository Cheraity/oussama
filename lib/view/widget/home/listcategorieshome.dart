
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../../../controller/home_controller.dart';
import '../../../core/constant/linkapi.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection:Axis.horizontal ,
        itemBuilder: (context,index){
          return Categories(
            i: index,
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(

            child: SvgPicture.network(
                "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}"),
              padding: EdgeInsets.symmetric(horizontal: 10),
                ),

          Text(
            "${categoriesModel.categoriesName}",
    style: const TextStyle(
    fontSize: 15,fontWeight: FontWeight.bold),

          )
        ],
      ),
    );
  }
}