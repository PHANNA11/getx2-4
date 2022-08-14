import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/allcard_shopping_screen.dart';
import 'package:getx_with_list/data/productdata.dart';
import 'package:getx_with_list/statemanagement/getx_product.dart';
import 'package:getx_with_list/widgets/product_custom.dart';

import 'models/product.dart';

void main() {
  runApp(MyApp());
}

List<Product> filterList = [];
TextEditingController searchController = TextEditingController();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shopping'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Badge(
            badgeContent: GetBuilder<ProductController>(
                builder: (_) => Text(productController.list.length.toString())),
            child: IconButton(
              onPressed: () {
                Get.to(() => AllCardShoppingScreen());
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 60,
              width: double.infinity,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search product',
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    filterList = list
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              children: List.generate(
                  searchController.text.isEmpty
                      ? list.length
                      : filterList.length, (index) {
                var pro = searchController.text.isEmpty
                    ? list[index]
                    : filterList[index];
                return ProductCustom(product: pro);
              }),
            ),
          )
        ],
      ),
    );
  }
}
