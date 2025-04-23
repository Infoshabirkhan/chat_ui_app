import 'package:demo_app/controllers/cubits/chat_cubit/chat_cubit.dart';
import 'package:demo_app/data/utils/app_colors.dart';
import 'package:demo_app/data/utils/app_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextArea extends StatefulWidget {
  const ChatTextArea({super.key});

  @override
  State<ChatTextArea> createState() => _ChatTextAreaState();
}

class _ChatTextAreaState extends State<ChatTextArea> {

  TextEditingController messageController =TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.sp, 20.sp, 16.sp, 5.sp),

      padding: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(

        border: Border.all(color: AppColors.tealColor),
        color: Color(0xffFEF3DC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.sp)
        )
      ),
      child: Row(

        children: [
          20.horizontalSpace,
          Expanded(child: TextField(

            controller: messageController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Start typing here.",
              border: InputBorder.none,
              isCollapsed: true
            ),
          ),),

          Row(
            children: [
              InkWell(

                  onTap: (){
                    if(messageController.text.isNotEmpty){
                      context.read<ChatCubit>().refreshChatList(message: messageController.text.trim());

                      messageController.clear();
                    }
                  },
                  child: SvgPicture.asset(AppSvg.boxSend)),
              5.horizontalSpace,
              Column(
                children: [
                  SvgPicture.asset(AppSvg.cameraIcon),
                  4.verticalSpace,
                  SvgPicture.asset(AppSvg.flagIcon),

                ],
              )

            ],
          ),
          10.horizontalSpace
        ],
      ),
    );
  }
}
