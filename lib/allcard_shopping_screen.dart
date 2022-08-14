import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/statemanagement/getx_product.dart';

class AllCardShoppingScreen extends StatelessWidget {
  AllCardShoppingScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: productController.list.length,
            itemBuilder: (context, index) {
              var pro = productController.list[index];
              return ListTile(
                title: Text(pro.name),
              );
            }));
  }
}
