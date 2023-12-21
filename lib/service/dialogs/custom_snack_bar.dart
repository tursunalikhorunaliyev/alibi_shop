import 'dart:async';

import 'package:alibi_shop/service/dialogs/show_top_snack_bar.dart';


class CustomSnackBar {
  Timer? _timer;

  _setTimer() {
    _timer = Timer(const Duration(seconds: 5), () {
      _timer = null;
    });
  }

  showError(String message) {
    if (_timer != null) return;
    showErrorSnackBar(message);
    _setTimer();
  }

  showSuccess(String message) {
    if (_timer != null) return;
    showSuccessSnackBar(message);
    _setTimer();
  }

  showWarning(String message) {
    if (_timer != null) return;
    showWarningSnackBar(message);
    _setTimer();
  }

  showInfo(String message) {
    if (_timer != null) return;
    showInoSnackBar(message);
    _setTimer();
  }
}
