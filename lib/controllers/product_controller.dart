import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  RxMap addProducts = {}.obs;

  get totalPrice {
    int totalPrice = 0;

    totalPrice = addProducts.entries
        .map((e) => e.key.price * e.value)
        .toList()
        .reduce((value, element) => value + element);

    return totalPrice;
  }

  void addProduct({required Product product}) {
    if (addProducts.containsKey(product)) {
      addProducts[product] += 1;
    } else {
      addProducts[product] = 1;
    }
    update();
  }

  void removeProduct({required Product product}) {
    if (addProducts.containsKey(product) && addProducts[product] == 1) {
      addProducts.removeWhere((key, value) => key == product);
    } else {
      addProducts[product] -= 1;
    }
    update();
  }
}

class ProductController1 extends GetxController {
  RxMap addProducts = {}.obs;

  void addProduct({required Product product}) {
    if (addProducts.containsKey(product)) {
      addProducts[product] += 1;
    } else {
      addProducts[product] = 1;
    }
    update();
  }

  void removeProduct({required Product product}) {
    if (addProducts.containsKey(product) && addProducts[product] == 1) {
      addProducts.removeWhere((key, value) => key == product);
    } else {
      addProducts[product] -= 1;
    }
    update();
  }
}
