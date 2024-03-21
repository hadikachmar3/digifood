import 'package:flutter/cupertino.dart';

class TextW600 extends StatelessWidget {
  const TextW600({
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
        fontSize: fontSize ?? 22,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: fontStyle ?? FontStyle.normal,
        overflow: textOverflow ?? TextOverflow.visible,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
