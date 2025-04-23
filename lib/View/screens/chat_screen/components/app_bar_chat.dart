import 'package:demo_app/View/widgets/my_text.dart';
import 'package:demo_app/data/utils/app_images.dart';
import 'package:demo_app/data/utils/app_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/utils/app_colors.dart';

class AppBarChat extends StatelessWidget {
  const AppBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.sp,
      // color: Colors.red,
      child: Row(
        children: [
          SvgPicture.asset(AppSvg.headingSvg, height: 49.5.sp),
          SvgPicture.asset(AppSvg.backButton, height: 49.5.sp),
          13.horizontalSpace,
          Expanded(
            child: Container(
              height: 48.sp,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.withAlpha(50),blurRadius: 10)
                ],
                color: AppColors.yellowDark,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.sp),
                  bottomRight: Radius.circular(32.sp)
                ),
                border: Border.all(color: Color(0xffA6E9DB)),
              ),
              child: Row(
                children: [
                  13.horizontalSpace,
                  Container(
                    width: 44.sp,
                    height: 44.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.profileImage,))
                    ),
                    // child: Cl(child: Image.asset(AppImages.profileImage)),
                  ),
                 8.horizontalSpace,
                  Expanded(child: MyText('Tommy’s Group',fontWeight: FontWeight.w700,fontSize: 18.sp,)),
                
                  SvgPicture.asset(AppSvg.moreIcon),
                  16.horizontalSpace,
                
                ],
              ),
            ),
          ),
          13.horizontalSpace,
        ],
      ),
    );
  }
}
