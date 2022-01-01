import 'package:flutter/material.dart';

class SText extends StatelessWidget {
  final title, size;
  final FontWeight fontWeight;
  final Color color, backgroundColor;
  final int maxlines;
  final EdgeInsets padding, margin;
  final BorderRadius borderRadius;
  final TextAlign textAlign;
  final double wordSpacing;
  final GestureTapCallback? onTap;
  const SText({
    Key? key,
    this.title = "Name",
    this.size = 15.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.maxlines = 1,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.backgroundColor = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.textAlign = TextAlign.start,
    this.wordSpacing = 1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
        ),
        child: RichText(
          textAlign: textAlign,
          maxLines: maxlines,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            style: TextStyle(
              wordSpacing: wordSpacing,
              color: color,
              fontFamily: 'Lato',
              fontSize: size,
              fontWeight: fontWeight,
            ),
            text: "$title",
          ),
        ),
      ),
    );
  }
}
