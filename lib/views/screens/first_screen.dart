import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:book/routes.dart';
import 'package:book/utils/theme.dart';
import 'package:book/views/screens/user/main_screen.dart';
import 'package:book/views/screens/admin/stock_screen.dart';
import 'package:book/views/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
    new AnimationController(duration: Duration(seconds: 5), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 15, right: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey.shade200,
                ])),
        child: Stack(
          children: [
            Positioned(
              child: Transform.translate(
                offset: Offset(
                  animation.value,
                  animation.value,
                ),
                child: BlurryContainer(
                  height: 150,
                  width: 150,
                  borderRadius: BorderRadius.circular(100),
                  color: googleColor,
                  blur: 2,
                  child: Container(),
                ),
              ),
            ),
            Bounce(
              child: Positioned(
                bottom: 60,
                left: 150,
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 150,
                    width: 150,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: googleColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Book   Shop",
                  style: TextStyle(
                      color: googleColor.withOpacity(.9),
                      fontSize: 25,
                      fontFamily: "Electrolize",
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // * side bar and shakes items
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // * side navBar
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          AuthButton(onPressed: () {Get.to(StockScreen());  }, text: 'Admin',),
                          AuthButton(onPressed: () {    Get.offNamed(Routes.mainScreen); }, text: 'User',),

                        ],
                      ),
                    ),

                    // * items list
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}