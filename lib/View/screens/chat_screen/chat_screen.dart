import 'package:demo_app/View/screens/chat_screen/components/chat_card.dart';
import 'package:demo_app/View/screens/chat_screen/components/chat_text_area.dart';
import 'package:demo_app/View/screens/chat_screen/components/receiver_chat_widget.dart';
import 'package:demo_app/View/screens/chat_screen/components/sender_chat_widget.dart';
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

                  // Expanded(child: BlocBuilder<ChatCubit, List<ChatModel>>(
                  //   builder: (context, state) {
                  //     return GroupedListView<ChatModel, DateTime>(
                  //       elements: state, groupBy: (ChatModel element) {
                  //       DateTime dateTime = element.dateTime;
                  //
                  //       String formattedDate =
                  //       DateFormat("dd MMM yyyy").format(dateTime);
                  //
                  //       return DateTime.parse(
                  //           formattedDate);
                  //     },
                  //
                  //       groupSeparatorBuilder:
                  //           (DateTime date) {
                  //         Duration difference = date
                  //             .difference(DateTime.now());
                  //         int daysDifference =
                  //             difference.inDays;
                  //
                  //         DateFormat dayNameFormat =
                  //         DateFormat('EEEE');
                  //         String dayName =
                  //         dayNameFormat.format(date);
                  //
                  //         return Container(
                  //           height: 24.0.h,
                  //           width: 100.w,
                  //           margin: EdgeInsets
                  //               .symmetric(
                  //               horizontal:
                  //               0.3.sw),
                  //           decoration:
                  //           BoxDecoration(
                  //             borderRadius:
                  //             BorderRadius
                  //                 .circular(
                  //                 3.0),
                  //             color: const Color(
                  //                 0xFFE8E8E8),
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               DateFormat('dd MMM yyyy').format(
                  //                   date) ==
                  //                   DateFormat('dd MMM yyyy').format(
                  //                       DateTime
                  //                           .now())
                  //                   ? 'Today'
                  //                   : daysDifference <
                  //                   6
                  //                   ? dayName
                  //                   :  DateFormat('dd MMM yyyy')
                  //                   .format(
                  //                   date),
                  //               style: GoogleFonts
                  //                   .cairo(
                  //                 fontSize: 10.0.sp,
                  //                 color:
                  //                 Colors.black,
                  //                 letterSpacing:
                  //                 0.07142857074737549,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },                      itemBuilder: (context,element){
                  //       return element.isMe ? ReceiverChatWidget(
                  //         message:element.message,) :
                  //
                  //       SenderChatWidget(image: element.image,
                  //           name: element.name,
                  //           text: element.message,
                  //           nameColor: element.color)
                  //       ;
                  //     },
                  //     );
                  //   },
                  //
                  // ),),
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
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      _formatDate(nextDate),
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12,
                                      ),
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
