import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/colors.dart';
import '../const/fonts_size.dart';
import '../helper/responsive_sizer.dart';

class AppTextStyle {
  TextStyle poppinsNormal(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return GoogleFonts.ubuntu(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font14, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle poppinsMedium(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return GoogleFonts.ubuntu(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font14, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle poppinsSemiBold(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return GoogleFonts.ubuntu(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font16, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle poppinsBold(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return GoogleFonts.ubuntu(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font18, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.bold,
    );
  }
}
