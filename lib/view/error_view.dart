import 'package:flutter/material.dart';
import 'package:flutter_tasks/const/size.dart';
import 'package:flutter_tasks/helper/responsive_sizer.dart';
import 'package:flutter_tasks/utils/textstyle_utils.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final bool isAnimationShow;
  const ErrorView(this.errorMessage,
      {super.key, required this.isAnimationShow});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isAnimationShow
            ? Lottie.asset('assets/lottie/error_animation.json',
                height: Responsive.ms(SizeClass.size200, context))
            : Container(),
        Text(
          errorMessage,
          style: AppTextStyle().poppinsSemiBold(context: context),
        )
      ],
    );
  }
}
