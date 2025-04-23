import 'package:flutter/cupertino.dart';

class ChatModel {
  final String message;
  final bool isMe;
  final String name;
  final String image;
  final DateTime dateTime;
  final Color color;



  ChatModel(
      {
        required this.color,
        required this.name,required this.image,
        required this.message, required this.isMe, required this.dateTime});
}


