import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);
//La solution A tous vos probléme de
// Location immobliére
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: ListTile(
            title: Text(title,
                style: TextStyle(color: Colors.white, fontSize: 15)),
            subtitle: Text(
                body, style: TextStyle(color: Colors
                .white, fontSize: 22)),
          ),
          height: 150,
          decoration: BoxDecoration(
              color: ColorApp.grey,
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: 150, width: 133, decoration: BoxDecoration(
              color: ColorApp.titulaire,
              borderRadius: BorderRadius.circular(160)
          ),),
        )
      ]),
    );
  }
  }