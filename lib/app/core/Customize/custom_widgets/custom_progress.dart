import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_rich_text.dart';

class CustomProgress extends StatelessWidget {
  final Color? color;

  final double size;

  final bool ignorePlatform;

  final double? textSize;

  final Color? textColor;

  final String? text;

  final TextStyle Function(TextStyle style)? textStyle;

  const CustomProgress(
      {Key? key,
      this.color,
      this.size = 20,
      this.ignorePlatform = false,
      this.textColor,
      this.textSize,
      this.textStyle,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color =
        (color != null) ? color! : Theme.of(context).colorScheme.secondary;

    var brightness = Theme.of(context).brightness;

    Widget widget;

    if (ignorePlatform) {
      widget = CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(_color),
      );
    } else {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 90,
          ),
          Txt(
            text ?? '',
            textStyle: textStyle,
            textSize: textSize,
            textColor: textColor,
          ),
          const SizedBox(
            width: 50,
          ),
          (Platform.isIOS)
              ? SizedBox(
                  height: 15,
                  width: 15,
                  child: MediaQuery(
                    data: MediaQueryData(platformBrightness: brightness),
                    child: const CupertinoActivityIndicator(),
                  ),
                )
              : SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(_color),
                  ),
                ),
        ],
      );
    }

    return FittedBox(
      child: widget,
    );
  }
}
