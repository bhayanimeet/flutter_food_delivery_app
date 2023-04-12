import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/views/screens/bill.dart';
import 'package:food_app/views/screens/homepage.dart';
import 'package:get/get.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({Key? key}) : super(key: key);

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Cart items",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 15,
      ),
      body: (productController.addProducts.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cart.png',
                    scale: 0.7,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Your cart is empty!!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(
                        () => const HomePage(),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        transition: Transition.fadeIn,
                      );
                    },
                    child: const Text(
                      "Explore things",
                    ),
                  ),
                ],
              ),
            )
          : Obx(() {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                    itemCount: productController.addProducts.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.network(
                                      "${productController.addProducts.keys.toList()[i].image}",
                                      height: 80,
                                      width: 140,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${productController.addProducts.keys.toList()[i].name}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Rs. ${productController.addProducts.keys.toList()[i].price}",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            productController.removeProduct(
                                                product: productController
                                                    .addProducts.keys
                                                    .toList()[i]);
                                          },
                                          icon: const Icon(
                                            Icons.remove_shopping_cart_outlined,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                productController.addProduct(
                                                    product: productController
                                                        .addProducts.keys
                                                        .toList()[i]);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        (Get.isDarkMode == true)
                                                            ? Colors.white
                                                            : Colors.black,
                                                    width: 1,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                child: const Icon(Icons.add,
                                                    size: 17),
                                              ),
                                            ),
                                            Container(
                                              height: 25,
                                              width: 25,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      (Get.isDarkMode == true)
                                                          ? Colors.white
                                                          : Colors.black,
                                                  width: 1,
                                                ),
                                                color: Colors.transparent,
                                              ),
                                              child: Text(
                                                  "${productController.addProducts.values.toList()[i]}"),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                productController.removeProduct(
                                                    product: productController
                                                        .addProducts.keys
                                                        .toList()[i]);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        (Get.isDarkMode == true)
                                                            ? Colors.white
                                                            : Colors.black,
                                                    width: 1,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                child: const Icon(Icons.remove,
                                                    size: 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => const BillPage(),
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: const Text("Invoice")),
                ],
              );
            }),
    );
  }
}
