import 'package:book/logic/controllers/cart_controller.dart';
import 'package:book/logic/controllers/prodect_controller.dart';
import 'package:book/model/product_model.dart';
import 'package:book/utils/text_utils.dart';
import 'package:book/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: controller.searchList.isEmpty &&
                controller.searchTextController.text.isNotEmpty
            ? Get.isDarkMode
                ? Icon(Icons.search_off_outlined,size: 300,color:Colors.grey ,)
                : Icon(Icons.search_off_outlined,size: 300,color: googleColor,)
            : GridView.builder(
                itemCount: controller.searchList.isEmpty
                    ? controller.prodects.length
                    : controller.searchList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  if (controller.searchList.isEmpty) {
                    return buildCardItems(
                        productName: controller.searchList[index].productName,
                        image: controller.prodects[index].imageUrl,
                        price: controller.prodects[index].price,
                        productId:
                            controller.prodects[index].productNumber.toString(),
                        productModels: controller.prodects[index],
                        onTap: () {
                          // Get.to(() => ProductDetailsScreen(
                          //   productModels: controller.productList[index],
                          // ));k
                        });
                  } else {
                    return buildCardItems(
                        productName: controller.searchList[index].productName,
                        image: controller.searchList[index].imageUrl,
                        price: controller.searchList[index].price,
                        productId: controller.searchList[index].productNumber
                            .toString(),
                        productModels: controller.searchList[index],
                        onTap: () {
                          // Get.to(() => ProductDetailsScreen(
                          //   productModels: controller.searchList[index],
                          // ));
                        });
                  }
                },
              ),
      );
    });
  }

  Widget buildCardItems({
    required String productName,
    required String image,
    required double price,
    required String productId,
    required Prodect productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFave(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextUtils(
                        text: " $productName",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: 13)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
