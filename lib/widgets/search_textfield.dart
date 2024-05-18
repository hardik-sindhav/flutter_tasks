import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/utils/textstyle_utils.dart';
import '../const/colors.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? textEditingController;
  const SearchTextField({super.key, this.onChanged, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search by user .....',
          hintStyle: AppTextStyle().poppinsMedium(context: context),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black38Color,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(Responsive.ms(SizeClass.size40, context)))),
          constraints: const BoxConstraints(maxHeight: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black38Color,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(Responsive.ms(SizeClass.size40, context)))),
          prefixIcon: const Icon(CupertinoIcons.search)),
    );
  }
}
