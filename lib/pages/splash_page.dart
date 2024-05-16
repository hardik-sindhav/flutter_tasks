import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/const/colors.dart';
import 'package:flutter_tasks/const/fonts_size.dart';
import 'package:flutter_tasks/const/text.dart';
import 'package:flutter_tasks/utils/textstyle_utils.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: Center(
        child: Text(
          TextClass.appNameText,
          style: AppTextStyle().poppinsSemiBold(
              context: context,
              fontSize: FontsSize.font26,
              textColor: AppColors.whiteColor),
        ),
      ),
    );
  }
}
