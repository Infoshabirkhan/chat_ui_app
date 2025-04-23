import 'package:demo_app/View/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarChat extends StatelessWidget {
  const AppBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.sp,
      color: Colors.red,
      child: Center(child: MyText('AppBar'),),
    );
  }
}
