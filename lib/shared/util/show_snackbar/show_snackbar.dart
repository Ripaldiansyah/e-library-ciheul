import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core.dart';

showCustomSnackbar({
  required String message,
  String? body,
  int duration = 4,
  Color? color,
  required IconData icon,
}) {
  var maxWidth = MediaQuery.of(Get.currentContext).size.width;
  var yourMaxWidth = 400;
  double marginHorizontal = 20;

  if (maxWidth > 760) {
    marginHorizontal = (maxWidth - yourMaxWidth) / 2;
  }

  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: duration),
    padding: const EdgeInsets.all(0.0),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    margin: EdgeInsets.only(
      bottom: 20,
      left: marginHorizontal,
      right: marginHorizontal,
    ),
    content: QAlert(
      color: color,
      message: message,
      duration: duration,
      icon: icon,
    ),
  );
  ScaffoldMessenger.of(globalContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

class QAlert extends StatelessWidget {
  const QAlert({
    super.key,
    this.color,
    this.icon,
    required this.message,
    this.duration = 4,
  });
  final Color? color;
  final IconData? icon;
  final String message;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: color ?? primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

snackbarDanger({required String message, int duration = 4}) {
  showCustomSnackbar(
    message: message,
    duration: duration,
    color: dangerColor,
    icon: Icons.dangerous_outlined,
  );
}

snackbarSuccess({required String message, int duration = 4}) {
  showCustomSnackbar(
    message: message,
    duration: duration,
    color: successColor,
    icon: Icons.check_circle_outline,
  );
}

snackbarInfo({required String message, int duration = 4}) {
  showCustomSnackbar(
    message: message,
    duration: duration,
    color: infoColor,
    icon: Icons.info_outline,
  );
}

snackbarWarning({required String message, int duration = 4}) {
  showCustomSnackbar(
    message: message,
    duration: duration,
    color: warningColor,
    icon: Icons.warning_amber_outlined,
  );
}
