import 'package:bloc/bloc.dart';
import 'package:demo_app/data/models/chat_model.dart';
import 'package:demo_app/data/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<List<ChatModel>> {
  ChatCubit(super.initialState);

  refreshChatList({String? message}){

    if(message !=null){
      ChatRepo.chatData.add(ChatModel(color: Colors.black, name: 'name', image: 'image', message: message, isMe: true, dateTime: DateTime.now()));
    }

    List<ChatModel> chatList = List.from(ChatRepo.chatData);


    emit(chatList);
  }
}
