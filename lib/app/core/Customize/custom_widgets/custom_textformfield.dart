import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/colors.dart';
import 'custom_rich_text.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    this.title,
    required TextEditingController controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.submit,
    this.onChange,
    this.initialValue,
    this.hint,
    this.hint2,
    this.readOnly = false,
    this.autoFocus = false,
    this.horizontalPadding = 0,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength = 500,
    this.onTap,
    this.icon,
    this.endIcon,
    this.label,
    this.style = const TextStyle(
      fontFamily: 'ReadexPro',
      fontSize: 16,
      color: Color(0xff292929),
      letterSpacing: -0.4,
      fontWeight: FontWeight.w500,
    ),
    Key? key,
    this.isFilled = false,
    this.verticalPadding = 0,
    this.errorText,
    this.withClearIcon = true,
    this.height = 0.0,
    this.borderRadius = 8,
    this.borderColor = AppColors.black,
    this.borderFocusColor = AppColors.black,
    this.filledColor = Colors.white,
    this.hintStyle = const TextStyle(
      fontFamily: 'ReadexPro',
      fontSize: 14,
      color: AppColors.hintColor,
    ),
    this.textAlign = TextAlign.start,
    this.borderWidth = 1,
    this.text,
    required this.textPadding,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final Function? submit;
  final String? initialValue;
  final String? text;
  final String? title;
  final String? hint;
  final String? hint2;
  final bool readOnly;
  final bool autoFocus;
  final bool isPassword;
  final bool isFilled;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  final double borderRadius;
  final double textPadding;
  final Color borderColor;
  final double borderWidth;
  final Color borderFocusColor;
  final Color filledColor;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;
  final Widget? icon;
  final Widget? endIcon;
  final Widget? label;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign textAlign;

  final String? errorText;

  final bool withClearIcon;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  void _onListen() => setState(() {});

  final node1 = FocusNode();

  @override
  void initState() {
    widget._controller.addListener(_onListen);
    super.initState();
    node1.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + node1.hasFocus.toString());
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.submit == null &&
        widget.textInputAction == TextInputAction.done) {
      throw 'Error: onSubmit == null && inputAction == TextInputAction.done. Provide an onSubmit function.';
    }

    // var size = Get.mediaQuery.size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: widget.textPadding),
            Txt(
              widget.text ?? '',
              textStyle: (_) => const TextStyle(
                fontSize: 15,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          // width: size.width - widget.horizontalPadding,
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: widget.verticalPadding),

          //for number
          // Theme.of(Get.context!).textTheme.subtitle2!.copyWith(
          //     letterSpacing: 2,
          //     fontSize: 24,
          //     color: const Color(0xff343434),
          //     fontWeight: FontWeight.w300)
          child: Center(
            child: TextFormField(
                style: widget.keyboardType == TextInputType.phone
                    ? widget.style!.copyWith(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: const Color(0xff343434),
                        fontWeight: FontWeight.w300)
                    : widget.style,
                onTap: widget.onTap,
                initialValue: widget.initialValue,
                controller: widget._controller,
                readOnly: widget.readOnly,
                keyboardType: widget.keyboardType,
                autofocus: widget.autoFocus,
                textInputAction: widget.textInputAction,
                maxLines: widget.maxLines,
                textAlign: widget.textAlign,
                maxLength: widget.keyboardType == TextInputType.phone
                    ? 8
                    : widget.maxLength!,
                focusNode: node1,

                // scrollPadding: EdgeInsets.all(10),
                // textAlignVertical: TextAlignVertical.center,
                // textAlign: TextAlign.justify,

                // ignore: avoid_bool_literals_in_conditional_expressions
                obscureText: (widget.isPassword == true)
                    ? (isVisible == true)
                        ? !isVisible
                        : !isVisible
                    : false,
                validator: widget.validator != null
                    ? (String? value) => widget.validator!(value)
                    : null,
                onChanged: widget.onChange != null
                    ? (String? value) => widget.onChange!(value)
                    : null,
                onFieldSubmitted: (_) {
                  if (widget.textInputAction != TextInputAction.done &&
                      widget.textInputAction != TextInputAction.search) return;
                  widget.submit!();
                },
                inputFormatters: (widget.keyboardType == TextInputType.number)
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : <TextInputFormatter>[
                        FilteringTextInputFormatter.deny('\n'),
                      ],
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: const TextStyle(fontSize: 0),
                  contentPadding: widget.textAlign == TextAlign.center
                      ? EdgeInsets.only(
                          top: widget.maxLines! > 1 ? 15 : widget.height,
                          bottom: widget.maxLines! > 1 ? 10 : widget.height)
                      : EdgeInsets.only(
                          right: widget.icon != null ? 8 : 20,
                          left: 10,
                          top: widget.maxLines! > 1 ? 15 : widget.height,
                          bottom: widget.maxLines! > 1 ? 10 : widget.height),
                  labelText: widget.title,
                  labelStyle: widget.hintStyle!,
                  errorText: widget.errorText,
                  hintText: widget.hint,
                  label: widget.label,

                  /*
                  *               hintText: widget.hint == null ? null : "      ${widget.hint}",
                  label: widget.label == null
                      ? null
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                    children: [
                      w_15,
                      widget.label!
                    ],
                        ),*/

                  hintStyle: widget.hintStyle,

                  prefixIcon: widget.icon,
                  // to make label in the start of field if it large
                  alignLabelWithHint: true,
                  //to show lable in top of field
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  // suffix: ,
                  suffixIconColor: Colors.red,
                  suffixIcon: widget.endIcon != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const SizedBox(
                                width: 2,
                              ),
                              widget.endIcon ?? const SizedBox(),
                              const SizedBox(
                                width: 2,
                              ),
                              clearButton(context) ?? const SizedBox(),
                              const SizedBox(
                                width: 2,
                              )
                            ])
                      : ((widget.isPassword)
                          ? passIcon()
                          : clearButton(context)),
                  filled: widget.isFilled,
                  fillColor: widget.filledColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor,
                        width: widget.borderWidth,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderFocusColor,
                        width: widget.borderWidth,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor,
                        width: widget.borderWidth,
                      )),
                ),
                cursorColor: AppColors.black,
                onEditingComplete: () =>
                    widget.textInputAction == TextInputAction.done ||
                            widget.textInputAction == TextInputAction.search
                        ? node1.unfocus()
                        : FocusScope.of(context).nextFocus()

                // onSaved: (input) {
                //   var value;
                //   switch (data[valKey].runtimeType) {
                //     case int:
                //       value = input is int ? input : int.parse(input!);
                //       break;
                //     case double:
                //       value = input is double ? input : double.parse(input!);
                //       break;
                //     case String:
                //       value = input is String ? input : input.toString();
                //       break;
                //     default:
                //       break;
                //   }
                //   data[valKey] = value;
                // },

                ),
          ),
        ),
      ],
    );
  }

  IconButton passIcon() {
    return (isVisible == false)
        ? IconButton(
            onPressed: () => setState(() => isVisible = true),
            icon: const Icon(
              CupertinoIcons.eye,
              color: AppColors.black,
            ),
          )
        : IconButton(
            onPressed: () => setState(() => isVisible = false),
            icon: const Icon(
              CupertinoIcons.eye_slash,
              color: AppColors.black,
            ),
          );
  }

  Widget? clearButton(BuildContext context) {
    return (widget._controller.text.isEmpty)
        ? widget.icon == null
            ? null
            : const SizedBox(
                width: 0.0,
              ) //to center hint
        : widget.withClearIcon
            ? GestureDetector(
                onTap: () {
                  widget._controller.clear();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      child: Icon(
                        Icons.clear,
                        size: 13,
                        color: widget.borderColor == Colors.transparent
                            ? AppColors.black
                            : AppColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              )
            : null;
  }
}
