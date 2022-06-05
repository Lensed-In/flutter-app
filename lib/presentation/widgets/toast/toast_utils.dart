import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/presentation/themes/app_colors.dart';

showToast(String message, Color? color) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: LayoutConstants.dimen_16.sp,
    );

showErrorToast(String message) => showToast(message, Colors.redAccent);

showSuccessToast(String message) => showToast(message, AppColor.progressGreen);

showWarningToast(String message) => showToast(message, Colors.amber[800]);
