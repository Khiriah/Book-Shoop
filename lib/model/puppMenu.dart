
import 'package:book/logic/controllers/prodect_controller.dart';
import 'package:book/model/menu_item.dart';
import 'package:book/model/menu_item_poup.dart';
import 'package:book/views/screens/admin/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMenu extends StatelessWidget {
  String prodectId;
  String productName;
  String category;
  String quantity;
  String price;
  String description;
  String imageUrl;

  PopupMenu(
      {super.key,
        required this.prodectId,
        required this.productName,
        required this.category,
        required this.quantity,
        required this.price,
        required this.description,
        required this.imageUrl});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
          ...MenuItems.menuItems.map(buildItem).toList(),
        ]);
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
      value: item,
      child: Container(
        width: 147,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            Text(" "),
            Text(
              item.text,
              style: TextStyle(color: item.color),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {
      case MenuItems.itemUpdate:
        controller.productNameControlller.text = productName;
        controller.productCategoryController.text = category;
        controller.productQuantityController.text = quantity;
        controller.productPriceController.text = price;
        controller.productDescriptionController.text = description;
        controller.imgUrl = imageUrl;
        Get.to(EditProductScreen(
          prodectId: prodectId,
          productName: productName,
          category: category,
          price: price,
          quantity: quantity,
          description: description,
          imageUrl: imageUrl,
        ));
        break;
      case MenuItems.itemDelete:
        controller.deleteData(prodectId, productName);
        break;
    }
  }
}
