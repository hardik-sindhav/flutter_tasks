import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts_size.dart';
import '../utils/textstyle_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final Color? iconColor;
  final IconData? icon;
  final String? title;
  final bool? centerTitle;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final VoidCallback? voidCallback;

  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.textIconColor,
    this.iconColor,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
    this.voidCallback, this.centerTitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: menuItem,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.whiteColor,
      toolbarHeight: preferredSize.height,
      elevation: 0,
      title: Text(title ?? '',
          style: AppTextStyle().poppinsSemiBold(
              context: context, fontSize: FontsSize.font20)),
      centerTitle: centerTitle??false,
    );
  }
}
