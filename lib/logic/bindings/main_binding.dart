import 'package:book/logic/controllers/cart_controller.dart';
import 'package:book/logic/controllers/main_controller.dart';
import 'package:book/logic/controllers/prodect_controller.dart';
import 'package:book/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../controllers/animation_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(ProductController());
    Get.put(AnimationControllerr());
    Get.lazyPut(() => CartController());
  }
}