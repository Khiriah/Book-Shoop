import 'package:badges/badges.dart';
import 'package:book/logic/controllers/cart_controller.dart';
import 'package:book/logic/controllers/main_controller.dart';
import 'package:book/routes.dart';
import 'package:book/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/animation_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                  () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
              ],
              backgroundColor: Get.isDarkMode ? Colors.grey : Colors.grey,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.grey : googleColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.grey : googleColor,
                //   ),
                //   icon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.white : Colors.grey ,
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.grey : googleColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person_pin,
                    color: Get.isDarkMode ? Colors.grey : googleColor,
                  ),
                  icon: Icon(
                    Icons.person_pin,
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
