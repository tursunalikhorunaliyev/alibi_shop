import 'dart:ui';

import 'package:alibi_shop/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

showCustomBottomSheet(Widget widget, bool dismiss) {
  if (NavigationService.navigatorKey.currentState?.overlay != null) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: dismiss,
      context: NavigationService.navigatorKey.currentState!.context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget,
            ],
          ),
        );
      },
    );
  }
}


showCustomNoBlurBottomSheet(Widget widget, bool dismiss) {
  if (NavigationService.navigatorKey.currentState?.overlay != null) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: dismiss,
      isDismissible: dismiss,
      barrierColor: Colors.transparent,
      context: NavigationService.navigatorKey.currentState!.context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget,
            ],
          ),
        );
      },
    );
  }
}
