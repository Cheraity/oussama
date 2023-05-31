import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:memoire/controller/favorite_controller.dart';
import 'package:memoire/controller/items_controller.dart';
import 'package:memoire/core/constant/color.dart';
import 'package:memoire/data/model/logmentmodel.dart';

import '../../../core/constant/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final LogementModel itemsModel;
  final bool active;

  const CustomListItems({Key? key, required this.itemsModel,required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTopageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.logmentId}",
                  child:CachedNetworkImage(
                    imageUrl: AppLink.imagesItems + "/" + (itemsModel.logmentImage ?? ''),
                    height: 100,
                    fit: BoxFit.fill,
                  ),
              ),
                  const SizedBox(height: 10),
                  Text(
                    itemsModel.logmentTitre ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rating 3.5",
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.logmentPrix ?? ''} \$",
                        style: TextStyle(
                          color: ColorApp.titulaire,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                        ),
                      ),
                      GetBuilder<FavoriteController>(builder: (controller)=>
                          IconButton(
                            onPressed: () {
                              if(controller.isFavorite[itemsModel.logmentId]=="1"){
                                    controller.setFavorite(itemsModel.logmentId, "0");
                              }else{
                                controller.setFavorite(itemsModel.logmentId, "1");
                              }


                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.logmentId]=="1"
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                          ),
                      )

                    ],
                  ),





            ],
          ),

        ),
      ),
    );
  }
}
