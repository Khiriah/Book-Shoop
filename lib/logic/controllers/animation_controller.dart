import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerr extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller =
    new AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    controller.forward();
  }
}


