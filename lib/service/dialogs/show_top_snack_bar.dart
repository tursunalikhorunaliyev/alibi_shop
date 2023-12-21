
import 'package:alibi_shop/service/navigation/navigation_service.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


showInoSnackBar(String message) {
  Flushbar(
    padding: const EdgeInsets.symmetric(vertical: 12),
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.transparent,
    message: message,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  ).show(NavigationService.navigatorKey.currentState!.context);
}

showSuccessSnackBar(String message) {
  Flushbar(
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.transparent,
    message: message,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,

          ),
        ),
      ),
    ),
  ).show(NavigationService.navigatorKey.currentState!.context);
}

showErrorSnackBar(String message) {
  Flushbar(
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.transparent,
    message: message,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  ).show(NavigationService.navigatorKey.currentState!.context);
}

showWarningSnackBar(String message) {
  Flushbar(
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.transparent,
    message: message,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  ).show(NavigationService.navigatorKey.currentState!.context);
}
