import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memoire/core/constant/color.dart';
import 'package:memoire/core/constant/linkapi.dart';
import 'package:memoire/data/model/logmentmodel.dart';
import '../../controller/productdetails_controller.dart';

class ProductDetails extends StatelessWidget {

  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: ColorApp.titulaire,
                onPressed: () {},
                child: Text("Efectuer Reservation"  , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),))),


        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(color:ColorApp.titulaire),
                ),
                Positioned(
                    top: 30.0,
                    right: Get.width / 8,
                    left: Get.width / 8,
                    child: Hero(
                      tag: "${controller.itemsModel.logmentId}",
                      child: CachedNetworkImage(
                      imageUrl: AppLink.imagesItems +
                            "/" +
                            controller.itemsModel.logmentImage!,
                        height: 250,
                        fit: BoxFit.fill
                      ),
                    ))
              ],
            ),
              const SizedBox(
              height: 100,
    ),
    Container(
    padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "${controller.itemsModel.logmentTitre}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 24, // Modifier la taille du texte ici
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${controller.itemsModel.logmentDescription}",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Text(
                "nombre de chamre :",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${controller.itemsModel.logmentNbrPiece}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],),
            const SizedBox(height: 10),
            Row(children: [
              Text(
                "le prix par nuit:",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${controller.itemsModel.logmentPrix}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],),



          ],
        ),

        ),


    ])

    );
  }
}