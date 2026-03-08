import 'package:flutter/material.dart';

abstract class ISnackBarService {
  void showError(String message,{required BuildContext context});
  void showSuccess(String message,{required BuildContext context});
}
