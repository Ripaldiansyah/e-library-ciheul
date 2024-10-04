import 'package:flutter/material.dart';

import '../../../core.dart';

class ButtonReusable extends StatefulWidget {
  const ButtonReusable({
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
  });

  final String label;
  final Function onPressed;
  final Color? color;
  final Color? textColor;

  @override
  State<ButtonReusable> createState() => _ButtonReusable();
}

class _ButtonReusable extends State<ButtonReusable> {
  @override
  Widget build(BuildContext context) {
    var widgetWidth = MediaQuery.of(context).size.width;
    var widgetHeight = 46.0;
    var widgetFontSize = 16.0;

    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: widget.color ?? primaryColor,
        ),
        onPressed: () async {
          widget.onPressed();
        },
        child: null,
      ),
    );
  }
}
