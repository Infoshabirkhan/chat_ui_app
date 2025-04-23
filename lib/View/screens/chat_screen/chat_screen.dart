import 'package:demo_app/View/screens/chat_screen/components/chat_card.dart';
import 'package:demo_app/data/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/app_bar_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          SvgPicture.asset(AppSvg.backgroundImage,fit: BoxFit.cover,),
          Container(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              children: [
                AppBarChat(),
                Expanded(child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                  return ChatCard();
                })),

              ],
            ),




          ),
        ],
      ),
    );
  }
}
