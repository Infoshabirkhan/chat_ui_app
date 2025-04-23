import 'package:demo_app/View/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderChatWidget extends StatelessWidget {
  const SenderChatWidget(
      {super.key,
        required this.image,
        required this.name,
        required this.text,
        required this.nameColor});

  final String image, name, text;
  final Color nameColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 100,bottom: 10.sp),

      width: 500,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(-2, 2),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.1)),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
          border: Border.all(color: Color.fromRGBO(166, 233, 219, 1)),
          color: Color.fromRGBO(253, 217, 145, 1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24.sp,
                height: 24.sp,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image,))
                ),
                // child: Cl(child: Image.asset(AppImages.profileImage)),
              ),

              // CircleAvatar(
              //   radius: 15,
              //   foregroundImage: AssetImage(image),
              // ),
              SizedBox(
                width: 10,
              ),
              MyText(
                name,
                    color: nameColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          MyText(
            text,
           fontSize: 14.sp,
           fontWeight: FontWeight.w400,
           color: Color.fromRGBO(21, 53, 49, 1),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MyText("12:57",

                  fontSize: 12.sp,
                  color: Color.fromRGBO(74, 111, 106, 1),
                ),
          )
        ],
      ),
    );
  }
}