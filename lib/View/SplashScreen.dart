import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UploadFilePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // moving to the next screen after 2 seconds
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UploadFilePage(
                      imageFile: null,
                      imageEditStack: false,
                      toShowImage: false,
                      coverPhoto: "None",
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Image.asset('assets/SplashScreen.png'),
      ),
    ));
  }
}
