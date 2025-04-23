import 'package:demo_app/View/widgets/my_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiverChatWidget extends StatelessWidget {
  final String message;
  const ReceiverChatWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 100.sp,bottom: 10.sp),

      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25)),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), bottomLeft: Radius.circular(35)),
          border: Border.all(color: Color.fromRGBO(166, 233, 219, 1)),
          color: Color.fromRGBO(252, 200, 95, 1)),
      child: Column(
        children: [
          MyText(
            message,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: Color.fromRGBO(21, 53, 49, 1),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text("12:57",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Fraunces",
                  color: Color.fromRGBO(74, 111, 106, 1),
                )),
          )
        ],
      ),
    );
  }
}