import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/views/screens/homepage.dart';
import 'package:get/get.dart';

class FavoriteComponent extends StatefulWidget {
  const FavoriteComponent({Key? key}) : super(key: key);

  @override
  State<FavoriteComponent> createState() => _FavoriteComponentState();
}

class _FavoriteComponentState extends State<FavoriteComponent> {
  ProductController1 productController1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorite items",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: (productController1.addProducts.isEmpty)
          ? Center(
              child: Stack(
                alignment: const Alignment(0, 1.1),
                children: [
                  Image.asset(
                    'assets/images/like.png',
                    scale: 0.8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => const HomePage(),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        transition: Transition.fadeIn,
                      );
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade400),
                    ),
                    child: const Text(
                      "Explore things",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Obx(() {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productController1.addProducts.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Image.network(
                                  "${productController1.addProducts.keys.toList()[i].image}",
                                  height: 80,
                                  width: 100,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${productController1.addProducts.keys.toList()[i].name}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rs. ${productController1.addProducts.keys.toList()[i].price}",
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
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  productController1.removeProduct(
                                      product: productController1
                                          .addProducts.keys
                                          .toList()[i]);
                                },
                                icon: const Icon(
                                  Icons.remove_shopping_cart_outlined,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
    );
  }
}
