import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_with_list/models/product.dart';

import '../statemanagement/getx_product.dart';

class ProductCustom extends StatelessWidget {
  ProductCustom({required this.product, Key? key}) : super(key: key);
  Product product;
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(product.iamage))),
        ),
        Positioned(
          bottom: 4,
          left: 4,
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 4,
            child: IconButton(
                onPressed: () async {
                  await productController.addNewProduct(product);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 28,
                  color: Colors.white,
                )))
      ],
    );
  }
}
