import 'package:flutter/cupertino.dart';

class TextW500 extends StatelessWidget {
  const TextW500({
    super.key,
    required this.label,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.color,
    this.textDecoration,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
  });

  final String label;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        overflow: textOverflow,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
