import 'package:flutter/material.dart';

import '../../../core.dart';

class QButton extends StatefulWidget {
  const QButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  State<QButton> createState() => _ButtonReusable();
}

class _ButtonReusable extends State<QButton> {
  @override
  Widget build(BuildContext context) {
    var widgetWidth = MediaQuery.of(context).size.width;
    var widgetHeight = 46.0;
    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor == null
              ? primaryColor
              : widget.backgroundColor,
          foregroundColor: widget.foregroundColor == null
              ? Colors.white
              : widget.foregroundColor,
        ),
        onPressed: () {
          widget.onPressed();
        },
        child: Text(widget.label),
      ),
    );
  }
}
