import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts_size.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';
import '../pages/repos_page.dart';
import '../utils/textstyle_utils.dart';

class UserViewList extends StatelessWidget {
  final String userName;
  final String userPic;
  const UserViewList(
      {super.key, required this.userName, required this.userPic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.ms(SizeClass.size8, context)),
      height: Responsive.ms(SizeClass.size80, context),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(Responsive.ms(SizeClass.size8, context))),
          border: Border.all(color: AppColors.greyColor)),
      child: Row(
        children: [
          SizedBox(width: Responsive.ms(SizeClass.size10, context)),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: Responsive.ms(SizeClass.size60, context),
            width: Responsive.ms(SizeClass.size60, context),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(userPic),
          ),
          SizedBox(width: Responsive.ms(SizeClass.size14, context)),
          Text(
            userName,
            style: AppTextStyle()
                .poppinsSemiBold(context: context, fontSize: FontsSize.font18),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReposPage(user: userName),
                )),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.ms(SizeClass.size10, context),
              ),
              height: Responsive.ms(SizeClass.size40, context),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(
                      Responsive.ms(SizeClass.size6, context)))),
              child: Text(
                "View Repos",
                style: AppTextStyle().poppinsMedium(context: context),
              ),
            ),
          ),
          SizedBox(width: Responsive.ms(SizeClass.size10, context)),
        ],
      ),
    );
  }
}
