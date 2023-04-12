import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../controllers/product_controller.dart';
import '../../res/all_items_list.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({Key? key}) : super(key: key);

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  ProductController productController = Get.find();
  ProductController1 productController1 = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fruits"),
        centerTitle: true,
        elevation: 15,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: fruits.length,
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
                        fruits[i].image,
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
                                height:
                                MediaQuery.of(context).size.height *
                                    0.24,
                                width: MediaQuery.of(context).size.width /
                                    2.4,
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
                            fruits[i].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Rs. ${fruits[i].price.toString()}",
                                style: GoogleFonts.arya(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      fruits[i].isLiked =
                                      !fruits[i].isLiked;
                                    });
                                    if (fruits[i].isLiked == true) {
                                      productController1.addProduct(
                                          product: fruits[i]);
                                    } else if (fruits[i].isLiked ==
                                        false) {
                                      productController1.removeProduct(
                                          product: fruits[i]);
                                    }
                                  },
                                  child: (fruits[i].isLiked == false)
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
                                    message:
                                    '${fruits[i].name} Added to cart...',
                                    snackStyle: SnackStyle.FLOATING,
                                  ),
                                );
                                productController.addProduct(
                                    product: fruits[i]);
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
