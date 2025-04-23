import 'package:demo_app/controllers/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProviders {
  static List<BlocProvider> initialize() {
    return [
      BlocProvider<ChatCubit>(
        create: (context) => ChatCubit([]),
      ),

    ];
  }
}
