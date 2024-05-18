import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../const/colors.dart';
import '../const/fonts_size.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';
import '../utils/textstyle_utils.dart';

class ReposListView extends StatelessWidget {
  final int index;
  final int starCount;
  final String userName;
  final String userRepoUrl;
  const ReposListView(
      {super.key,
      required this.index,
      required this.userName,
      required this.starCount,
      required this.userRepoUrl});

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
          SizedBox(width: Responsive.ms(SizeClass.size14, context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/1.5,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "${index + 1}. $userName",
                  style: AppTextStyle().poppinsSemiBold(
                      context: context, fontSize: FontsSize.font18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.star_fill,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    starCount.toString(),
                    style: AppTextStyle().poppinsSemiBold(
                        context: context, fontSize: FontsSize.font14),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _launchUrl(Uri.parse(userRepoUrl)),
            child: Container(
                alignment: Alignment.center,
                height: Responsive.ms(SizeClass.size40, context),
                width: Responsive.ms(SizeClass.size40, context),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(
                        Responsive.ms(SizeClass.size6, context)))),
                child: const Icon(
                  CupertinoIcons.link,
                  color: Colors.black54,
                )),
          ),
          SizedBox(width: Responsive.ms(SizeClass.size10, context)),
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
