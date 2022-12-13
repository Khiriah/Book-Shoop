import 'package:book/logic/controllers/prodect_controller.dart';
import 'package:book/utils/theme.dart';
import 'package:book/views/widgets/product/cart/card_item.dart';
import 'package:book/views/widgets/product/cart/card_item1.dart';
import 'package:book/views/widgets/product/search_form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book/model/product_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Text(
              "  Welcome, Khairiah!",
              style: TextStyle(
                  color: googleColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 100,

              color: Colors.white,
              child: Container(
                  width: 350,
                  child: SearchProducts())),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.prodects = snapshot.data!.docs
                    .map((e) => Prodect(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        description: e['description'],
                        category: e['category'],
                        price: e['price'],
                        quantity: e['quantity'],
                        imageUrl: e['imageUrl']))
                    .toList();

                print('leeength ${controller.prodects.length}');
                if (controller.prodects.isNotEmpty) {
                  return CardItems();
                } else {
                  return Text("No thing");
                }
              } else {
                return  CardItems();
              }
            },
          ),
        ],
      ),
    );
  }
}
