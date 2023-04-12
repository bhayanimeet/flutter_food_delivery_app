import 'package:flutter/material.dart';
import 'package:food_app/components/cart_component.dart';
import 'package:food_app/components/category_component.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:get/get.dart';
import '../../components/favorite_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  IconData home = Icons.home;
  IconData fav = Icons.favorite_border;
  IconData cart = Icons.shopping_cart_outlined;
  PageController pageController = PageController(initialPage: 0, keepPage: true);

  ProductController productController = Get.put(ProductController());
  ProductController1 productController11 = Get.put(ProductController1());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
              if (currentIndex == 0) {
                home = Icons.home;
                fav = Icons.favorite_border;
                cart = Icons.shopping_cart_outlined;
              } else if (currentIndex == 1) {
                home = Icons.home_outlined;
                fav = Icons.favorite;
                cart = Icons.shopping_cart_outlined;
              } else if (currentIndex == 2) {
                home = Icons.home_outlined;
                fav = Icons.favorite_border;
                cart = Icons.shopping_cart;
              }
            });
          },
          children: const [
            CategoryComponent(),
            FavoriteComponent(),
            CartComponent(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: (Get.isDarkMode==true)?const Color(0xff3d4d5a):const Color(0xffdef0fc),
          onTap: (val) {
            setState(() {
              currentIndex = val;
              pageController.animateToPage(val,
                  duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              if (currentIndex == 0) {
                home = Icons.home;
                fav = Icons.favorite_border;
                cart = Icons.shopping_cart_outlined;
              } else if (currentIndex == 1) {
                home = Icons.home_outlined;
                fav = Icons.favorite;
                cart = Icons.shopping_cart_outlined;
              } else if (currentIndex == 2) {
                home = Icons.home_outlined;
                fav = Icons.favorite_border;
                cart = Icons.shopping_cart;
              }
            });
          },
          selectedItemColor: (Get.isDarkMode==true)?const Color(0xff3d4d5a):const Color(0xff035b96),
          unselectedItemColor: (Get.isDarkMode==true)?const Color(0xff3d4d5a):Colors.black38,
          items: [
            BottomNavigationBarItem(icon: Icon(home, size: 30), label: "Home"),
            BottomNavigationBarItem(icon: Icon(fav, size: 30), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(cart, size: 30), label: "Cart"),
          ],
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
