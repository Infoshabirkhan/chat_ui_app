import 'package:demo_app/data/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          SvgPicture.asset(AppSvg.backgroundImage,fit: BoxFit.cover,),
          Column(
            children: [
              Container(
                height: 100.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
