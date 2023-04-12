import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/cart_component.dart';
import 'package:food_app/components/category_component.dart';
import 'package:food_app/components/favorite_component.dart';
import 'package:food_app/views/screens/bill.dart';
import 'package:food_app/views/screens/burger.dart';
import 'package:food_app/views/screens/fruits.dart';
import 'package:food_app/views/screens/homepage.dart';
import 'package:food_app/views/screens/intro_page_1.dart';
import 'package:food_app/views/screens/intro_page_2.dart';
import 'package:food_app/views/screens/intro_page_3.dart';
import 'package:food_app/views/screens/juice.dart';
import 'package:food_app/views/screens/login_page.dart';
import 'package:food_app/views/screens/nothing.dart';
import 'package:food_app/views/screens/pizza.dart';
import 'package:food_app/views/screens/sandwich.dart';
import 'package:food_app/views/screens/snack.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'res/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Global.isVisited = prefs.getBool('isVisited') ?? false;
  Global.isLogged = prefs.getBool('isLogged') ?? false;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/intro1', page: () => const IntroScreen1()),
        GetPage(name: '/intro2', page: () => const IntroScreen2()),
        GetPage(name: '/intro2', page: () => const IntroScreen3()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/category', page: () => const CategoryComponent()),
        GetPage(name: '/favorite', page: () => const FavoriteComponent()),
        GetPage(name: '/cart', page: () => const CartComponent()),
        GetPage(name: '/pizza', page: () => const PizzaPage()),
        GetPage(name: '/burger', page: () => const BurgerPage()),
        GetPage(name: '/fruit', page: () => const FruitPage()),
        GetPage(name: '/sandwich', page: () => const SandwichPage()),
        GetPage(name: '/juice', page: () => const JuicePage()),
        GetPage(name: '/snacks', page: () => const SnacksPage()),
        GetPage(name: '/bill', page: () => const BillPage()),
        GetPage(name: '/nothing', page: () => const Nothing()),
      ],
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Get.off(
        () => (Global.isVisited == false)
            ? const IntroScreen1()
            : (Global.isLogged == false)
                ? const LoginScreen()
                : const HomePage(),
        curve: Curves.easeInOut,
        transition: Transition.fadeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal.shade500,
              Colors.teal.shade300,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: -440, end: 0),
              builder: (context, val, widget) => Transform.translate(
                offset: Offset(0, val),
                child: Image.asset(
                  'assets/images/logo.png',
                  filterQuality: FilterQuality.high,
                  scale: 1.7,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Food Delivery",
                  curve: Curves.easeInOut,
                  cursor: '',
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.arya(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
