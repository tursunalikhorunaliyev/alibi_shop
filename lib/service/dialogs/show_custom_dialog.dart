import 'dart:ui';

import 'package:alibi_shop/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';


Future<T?> showCustomDialog<T>(Widget widget, bool dismiss) async {
  if (NavigationService.navigatorKey.currentState?.overlay != null) {
    return showDialog<T?>(
      barrierDismissible: dismiss,
      context: NavigationService.navigatorKey.currentState!.context,
      builder: (_) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), child: widget);
      },
    );
  }
  return null;
}
