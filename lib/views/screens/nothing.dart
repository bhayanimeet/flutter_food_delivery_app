import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nothing extends StatefulWidget {
  const Nothing({Key? key}) : super(key: key);

  @override
  State<Nothing> createState() => _NothingState();
}

class _NothingState extends State<Nothing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Nothing as your search",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
      ),
    );
  }
}
