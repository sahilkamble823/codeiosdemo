import 'package:explorer/ui/homescreen.dart';
import 'package:explorer/ui/loginpage.dart';

import 'package:explorer/ui/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/main.dart';

import 'constants/homeBase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    final textTheme   = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.montserrat(textStyle: textTheme.bodyMedium),
        ),
      ),
      home:HomeBaseScreen(),
    );
  }
}
