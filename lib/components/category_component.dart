import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:food_app/views/screens/burger.dart';
import 'package:food_app/views/screens/fruits.dart';
import 'package:food_app/views/screens/juice.dart';
import 'package:food_app/views/screens/sandwich.dart';
import 'package:food_app/views/screens/snack.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../res/global.dart';
import '../views/screens/nothing.dart';
import '../views/screens/pizza.dart';

class CategoryComponent extends StatefulWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          "Online Shopping",
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 15, right: 10),
                child: Text(
                  "Find your food",
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: SizedBox(
                  height: 55,
                  child: TextField(
                    controller: Global.text,
                    onSubmitted: (val) async {
                      Global.title = val;
                      if (Global.title == "Pizza" || Global.title == "pizza") {
                        Get.to(
                          () => const PizzaPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else if (Global.title == "Burger" ||
                          Global.title == "burger") {
                        Get.to(
                          () => const BurgerPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else if (Global.title == "fruits" ||
                          Global.title == "Fruits") {
                        Get.to(
                          () => const FruitPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else if (Global.title == "sandwich" ||
                          Global.title == "Sandwich") {
                        Get.to(
                          () => const SandwichPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else if (Global.title == "Juice" ||
                          Global.title == "juice") {
                        Get.to(
                          () => const JuicePage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else if (Global.title == "snacks" ||
                          Global.title == "Snacks") {
                        Get.to(
                          () => const SnacksPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.to(
                          () => const Nothing(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon:
                          Icon(Icons.search, color: Colors.grey.shade700),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.lightBlue.shade50,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const PizzaPage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          link:
                              'https://tse4.mm.bing.net/th?id=OIP._iNiCuvpH9iM6ncbrN-ZNQHaE8&pid=Api&P=0',
                          title: "Pizza",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const BurgerPage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          link:
                              'https://images2.alphacoders.com/108/1085778.jpg',
                          title: "Burger",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const FruitPage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          link:
                              'https://tse2.mm.bing.net/th?id=OIP.tGCKjuCRe-fmOGTZaOBAdAHaL2&pid=Api&P=0',
                          title: "Fruit",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const SandwichPage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                            link:
                                'https://images6.alphacoders.com/868/thumb-1920-868514.jpg',
                            title: "Sandwich"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const JuicePage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          link: 'https://images8.alphacoders.com/746/thumb-1920-746166.jpg',
                          title: "Juice",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const SnacksPage(),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                            link: 'https://wallpaperaccess.com/full/1891213.jpg',
                            title: "Snacks"),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Hot Deals",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => const PizzaPage(),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          transition: Transition.fadeIn,
                        );
                      },
                      child: myContainer(
                        link: 'https://tse1.mm.bing.net/th?id=OIP.ohV_IdbG0L84rGdEhiCHOQHaLO&pid=Api&P=0',
                        title: 'Pizza',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => const FruitPage(),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          transition: Transition.fadeIn,
                        );
                      },
                      child: myContainer(
                        link: 'https://tse4.mm.bing.net/th?id=OIP.d9jl8-5oBZWTQpMc7H0e3wHaE7&pid=Api&P=0',
                        title: "Mango",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => const JuicePage(),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          transition: Transition.fadeIn,
                        );
                      },
                      child: myContainer(
                        link: 'https://tse1.mm.bing.net/th?id=OIP.yBL2LTCfxKePAeUh7OqXvgHaLH&pid=Api&P=0',
                        title: "watermelon",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.teal.shade400, size: 30),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer({required String? link, required String? title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            surfaceIntensity: 0.6,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(8),
            ),
            depth: 10,
            lightSource: LightSource.topLeft,
            color: Colors.white,
            shadowDarkColor: Colors.grey.shade500,
          ),
          child: Container(
            width: 100,
            color: Colors.grey.shade50,
            height: 100,
            child: Image.network(
              fit: BoxFit.cover,
              link!,
              height: 70,
              loadingBuilder: (context, child, image) {
                if (image == null) return child;
                return SkeletonAnimation(
                  shimmerColor: Colors.white54,
                  curve: Curves.easeInOut,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 0.6,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(8),
                      ),
                      depth: 10,
                      lightSource: LightSource.topLeft,
                      color: Colors.white,
                      shadowDarkColor: Colors.grey.shade500,
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey.shade50,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Text(
          title!,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }
}
