import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_navigator.dart';

Future<void> snackBarWidget({
  required String msg,
  required IconData icons,
  required Color iconcolor,
  required Color texcolor,
  required Color backgeroundColor,
}) async {
  final completer = Completer<void>();

  final snackbar = SnackBar(
    shape: const StadiumBorder(),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgeroundColor,
    margin: EdgeInsets.only(
        bottom: 20,
        left: ScreenUtil().scaleWidth * .035,
        right: ScreenUtil().scaleWidth * .035),
    duration: const Duration(seconds: 3),
    content: SizedBox(
      width: ScreenUtil().scaleWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ScreenUtil().scaleWidth * 75,
            child: Text(
              msg,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: texcolor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            icons,
            color: iconcolor,
          )
        ],
      ),
    ),
  );
  scaffoldMsgKey.currentState?.showSnackBar(snackbar).closed.then((reason) {
    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  return completer.future;
}
