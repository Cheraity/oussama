import 'package:flutter/material.dart';


class LogoAutho extends StatelessWidget {
  const LogoAutho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
                "assets/images/signup.png"
            ),
          ),
        ));
  }
}