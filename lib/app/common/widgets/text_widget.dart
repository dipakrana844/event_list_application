import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const TextWidget({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.52,
      child: Text(
        text,
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    );
  }
}
