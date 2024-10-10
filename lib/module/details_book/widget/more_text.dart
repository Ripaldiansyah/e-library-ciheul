import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';

class MoreText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  const MoreText({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  State<MoreText> createState() => _MoreTextState();
}

class _MoreTextState extends State<MoreText> {
  bool visible = false;

  updateVisibility() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: widget.textStyle,
          ),
          textDirection: TextDirection.ltr,
          maxLines: visible ? null : 3,
        )..layout(
            maxWidth: constraints.maxWidth,
          );

        final isOverflow = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              textAlign: TextAlign.justify,
              maxLines: visible ? null : 3,
              overflow: visible ? TextOverflow.visible : TextOverflow.ellipsis,
              style: widget.textStyle,
            ),
            if (isOverflow | visible == true)
              InkWell(
                onTap: () => updateVisibility(),
                child: Text(
                  visible ? "Hide Description" : "Read More",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
