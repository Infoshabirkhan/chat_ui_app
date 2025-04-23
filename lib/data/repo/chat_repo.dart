import 'package:demo_app/data/models/chat_model.dart';
import 'package:demo_app/data/utils/app_colors.dart';
import 'package:demo_app/data/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRepo{
  
  
  
  static List<ChatModel> chatData= [
    ChatModel(color: AppColors.tealColor,name: "Lousiana", image: AppImages.image1, message: "Hi how are you?", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 5))),
    ChatModel(color: AppColors.tealColor,name: "Lousiana", image: AppImages.image1, message: "@Tommy Feeling ok?", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 5))),
    ChatModel(color: Colors.black,name: "Tommy", image: AppImages.image2, message: "Yes im good. thanks for asking. Didn’t do much. feeling bit sick after that meal. So just exhausted. watching netflux, 😢", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 5))),
    ChatModel(color: Colors.black,name: "", image: AppImages.image2, message: "hiking with the some people.it was  extremely hot couldn’t be bothered in the end. How r U?", isMe: true , dateTime: DateTime.now().subtract(Duration(days: 5))),
    ChatModel(color: Color(0xffF4392A),name: "Cristofer", image: AppImages.profileImage, message: "hiking with the some people.it was  extremely hot couldn’t be bothered in the end. How r U?", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 5))),
    ChatModel(color: AppColors.tealColor,name: "Lousiana", image: AppImages.image1, message: "Hi how are you?", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 3))),

   /// New day
    ChatModel(color: Colors.black,name: "Tommy", image: AppImages.image2, message: "Yes im good. thanks for asking. Didn’t do much. feeling bit sick after that meal. So just exhausted. watching netflux", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 4))),
    ChatModel(color: Color(0xffF4392A),name: "Cristofer", image: AppImages.profileImage, message: "hiking with the some people.it was  extremely hot couldn’t be bothered in the end. How r U?", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 4))),
    ChatModel(color: Colors.black,name: "Tommy", image: AppImages.image2, message: "Yes im good. thanks for asking. Didn’t do much. feeling bit sick after that meal. So just exhausted. watching netflux, 😢", isMe: false , dateTime: DateTime.now().subtract(Duration(days: 4))),
    ChatModel(color: Colors.black,name: "", image: AppImages.image2, message: "hiking with the some people.it was  extremely hot couldn’t be bothered in the end. How r U?", isMe: true , dateTime: DateTime.now().subtract(Duration(days: 4))),

  ];
}