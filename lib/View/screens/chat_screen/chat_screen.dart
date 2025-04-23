import 'package:demo_app/View/screens/chat_screen/components/chat_card.dart';
import 'package:demo_app/View/screens/chat_screen/components/chat_text_area.dart';
import 'package:demo_app/View/screens/chat_screen/components/receiver_chat_widget.dart';
import 'package:demo_app/View/screens/chat_screen/components/sender_chat_widget.dart';
import 'package:demo_app/View/widgets/my_text.dart';
import 'package:demo_app/controllers/cubits/chat_cubit/chat_cubit.dart';
import 'package:demo_app/data/models/chat_model.dart';
import 'package:demo_app/data/utils/app_images.dart';
import 'package:demo_app/data/utils/app_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/app_bar_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    context.read<ChatCubit>().refreshChatList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF3DC),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              // top: 0,
              // bottom: 0,
              child: SvgPicture.asset(
                AppSvg.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Column(
                children: [
                  AppBarChat(),

                  Expanded(
                    child: BlocBuilder<ChatCubit, List<ChatModel>>(
                      builder: (context, state) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            final message = state[index];
                            return message.isMe
                                ? ReceiverChatWidget(message: message.message)
                                : SenderChatWidget(
                                  image: message.image,
                                  name: message.name,
                                  text: message.message,
                                  nameColor: message.color,
                                );
                          },
                          separatorBuilder: (context, index) {
                            final currentDate = state[index].dateTime;
                            final nextDate = state[index + 1].dateTime;

                            bool isSameDay =
                                currentDate.year == nextDate.year &&
                                currentDate.month == nextDate.month &&
                                currentDate.day == nextDate.day;

                            if (!isSameDay) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    child: MyText(
                                      _formatDate(nextDate),
                                        color: Color(0xff0C201D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        );
                      },
                    ),
                  ),

                  ChatTextArea(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  final now = DateTime.now();
  if (now.year == date.year && now.month == date.month && now.day == date.day) {
    return "Today";
  } else if (now.subtract(Duration(days: 1)).day == date.day) {
    return "Yesterday";
  } else {
    return DateFormat('dd MMM yyyy').format(date); // e.g., Apr 22, 2025
  }
}

//                  Expanded(child: BlocBuilder<ChatCubit, List<ChatModel>>(
//   builder: (context, state) {
//     return ListView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                       itemCount: state.length,
//                       itemBuilder: (context,index){
//                     return state[index].isMe ? ReceiverChatWidget(message: state[index].message,):
//
//                     SenderChatWidget(image: state[index].image, name: state[index].name, text: state[index].message, nameColor: state[index].color)
//                     ;
//                   });
//   },
// )),
