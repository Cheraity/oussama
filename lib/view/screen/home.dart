
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:memoire/core/constant/linkapi.dart';
import 'package:memoire/data/model/logmentmodel.dart';
import 'package:memoire/view/widget/home/customtitlehome.dart';
import 'package:memoire/view/widget/home/listcategorieshome.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';
import '../widget/customappBar.dart';
import '../widget/home/customcardhome.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) =>
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                      titleappbar: "où allez-vous",
                      onPressedIcon: () {},
                      onPressedSearch: () {
                      controller.onSearchItems();
                      },
                    onChanged: (val){
                      controller.checkSearch(val);

                    },
                  ),
                  !controller.isSearch
                      ?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const CustomCardHome(
                          title: "La solution A tous vos probléme de", body: " Location immobliére"),
                      const SizedBox(height: 10),
                      const CustomTitleHome(title: "Catégorie"),
                      const SizedBox(height: 10),
                      const ListCategoriesHome(),



                      const SizedBox(height: 10),
                      const CustomTitleHome(title: "Annonces"),

                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: controller.logment.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Image.network(
                                      "${AppLink.imagesItems}/${controller.logment[i]['logment_image']}",
                                      height: 100,
                                      width: 150,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: ColorApp.black.withOpacity(0.2),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    height: 120,
                                    width: 200,
                                  ),
                                  Positioned(
                                      left: 10,
                                      child: Text(
                                        "${controller.logment[i]['logment_titre']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ))
                                ],
                              );
                            }),
                      ),
                    ],
                  )
                      :ListItemsSerach(listdatamodel: controller.listdata,)
                ],
              )));

  }
}
class ListItemsSerach extends GetView<HomeControllerImp> {
  final List<LogementModel>  listdatamodel;
  const ListItemsSerach({Key? Key, required this.listdatamodel}):super(key: Key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            controller.goTopageProductDetails(listdatamodel[index]);
          },
          child:  Container(
            child: Card(
              child: Row(
                children: [
                  Expanded(child: CachedNetworkImage(imageUrl: "${AppLink.imagesItems}/${listdatamodel[index].logmentImage}")),
                  Expanded(flex: 2,child: ListTile(
                    title: Text(listdatamodel[index].logmentTitre!),

                  ),)

                ],
              ),
            ),
          ),

        );

        }
    );

  }
}
