import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../controllers/firestore_like_item_db_helper.dart';
import '../../res/all_items_list.dart';

class PizzaPage extends StatefulWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  State<PizzaPage> createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  ProductController productController = Get.find();
  ProductController1 productController1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizza"),
        centerTitle: true,
        elevation: 15,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: pizza.length,
        itemBuilder: (context, i) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 0.5,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(8),
                      ),
                      depth: 7,
                      lightSource: LightSource.topLeft,
                      color: Colors.white,
                      shadowDarkColor: Colors.grey.shade400,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width / 2.4,
                      color: Colors.grey.shade50,
                      child: Image.network(
                        pizza[i].image,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, image) {
                          if (image == null) return child;
                          return SkeletonAnimation(
                            shimmerColor: Colors.white54,
                            curve: Curves.easeInOut,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                surfaceIntensity: 0.5,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8),
                                ),
                                depth: 7,
                                lightSource: LightSource.topLeft,
                                color: Colors.white,
                                shadowDarkColor: Colors.grey.shade400,
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.24,
                                width: MediaQuery.of(context).size.width / 2.4,
                                color: Colors.grey.shade50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width / 2.2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pizza[i].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Rs. ${pizza[i].price.toString()}",
                                style: GoogleFonts.arya(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pizza[i].isLiked = !pizza[i].isLiked;
                                    });
                                    if (pizza[i].isLiked == true) {
                                      productController1.addProduct(
                                          product: pizza[i]);
                                    }
                                    else if (pizza[i].isLiked == false) {
                                      productController1.removeProduct(
                                          product: pizza[i]);
                                    }
                                  },
                                  child: (pizza[i].isLiked == false)
                                      ? const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  )
                                      : const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: 'Cart',
                                    backgroundColor: Colors.teal.shade300,
                                    snackPosition: SnackPosition.BOTTOM,
                                    borderRadius: 20,
                                    duration: const Duration(seconds: 2),
                                    margin: const EdgeInsets.all(15),
                                    message: '${pizza[i].name} Added to cart...',
                                    snackStyle: SnackStyle.FLOATING,
                                  ),
                                );
                                productController.addProduct(product: pizza[i]);
                              },
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
