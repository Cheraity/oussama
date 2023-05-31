import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/linkapi.dart';
import '../../../data/model/logmentmodel.dart';

class ListItemsHome extends StatelessWidget {
  final List<LogementModel> logments;

  const ListItemsHome({Key? key, required this.logments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: logments.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final LogementModel logement = logments[index];
          return CustomListItems(itemsModel: logement);
        },
      ),
    );
  }
}

class CustomListItems extends StatelessWidget {
  final LogementModel itemsModel;

  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/${itemsModel.logmentImage ?? ''}",
                height: 100,
                width: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              Text(
                itemsModel.logmentTitre ?? '',
                style: TextStyle(
                  color: ColorApp.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
