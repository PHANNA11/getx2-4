import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_with_list/models/product.dart';

class ProductController extends GetxController {
  List<Product> list = <Product>[].obs();
  addNewProduct(Product product) async {
    list.add(product);
    update();
  }
}
