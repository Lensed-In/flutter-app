import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/extensions/string_extensions.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/themes/app_text_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/presentation/widgets/button_widget/button_widgets.dart';

import 'input_text_form_field_constants.dart';

// ignore: must_be_immutable
class InputTextFormFieldSecondary extends StatefulWidget {
  final GlobalKey<FormState>? formStateKey;
  final bool showError;
  final bool obscureInput;
  final String? labelString;
  final String? hintString;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String?)? onInputChanged;
  final Function(String?)? onInputSubmitted;
  final String Function(String?)? inputValidator;
  final Decoration? decoration;
  final Widget? suffix;
  String? helperString;
  final int? maxLines;
  final TextAlign? inputTextAlign;
  final TextInputAction? inputAction;

  InputTextFormFieldSecondary({
    Key? key,
    this.formStateKey,
    this.showError = false,
    this.obscureInput = false,
    this.labelString = '',
    this.hintString = '',
    String? helperString,
    this.initialValue,
    this.focusNode,
    this.inputType,
    this.inputFormatters,
    this.controller,
    this.onInputChanged,
    this.onInputSubmitted,
    this.inputValidator,
    this.suffix,
    this.decoration,
    this.maxLines,
    this.inputTextAlign,
    this.inputAction,
  }) : super(key: key) {
    this.helperString = helperString ?? '';
  }

  @override
  State<StatefulWidget> createState() => _InputTextFormFieldSecondaryState();
}

class _InputTextFormFieldSecondaryState
    extends State<InputTextFormFieldSecondary> {
  TextEditingController? _textEditingController;
  InputBorder? _inputBorder;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller;
    _inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      gapPadding: LayoutConstants.dimen_0,
      borderRadius: InputTextFormFieldConstants.textFieldBorderRadius,
    );
    _textEditingController ??=
        TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.labelString?.isNotNullAndEmpty == true) _labelText(),
            _inputFieldWithSuffix(),
            if (widget.helperString?.isNotNullAndEmpty == true) _helperText(),
          ],
        ),
      );

  Container _labelText() => Container(
        margin: EdgeInsets.only(
          bottom: LayoutConstants.dimen_10.h,
          top: LayoutConstants.dimen_8.h,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.labelString ?? '',
          style: AppTextTheme.inputLabelStyle,
        ),
      );

  Container _inputFieldWithSuffix() => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: _textEditingController?.text.isNotNullAndEmpty == true
                ? AppColor.grey25
                : AppColor.grey25,
          ),
          borderRadius: InputTextFormFieldConstants.textFieldBorderRadius,
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          alignment: Alignment.centerRight,
          children: [
            _inputField(),
            widget.suffix ??
                (widget.obscureInput
                    ? buttonText(
                        context,
                        showPassword ? 'Hide' : 'Show',
                        onPress: () => {
                          setState(() {
                            showPassword = !showPassword;
                          })
                        },
                        splash: false,
                      )
                    : Container()),
          ],
        ),
      );

  TextFormField _inputField() => TextFormField(
        autofocus: false,
        focusNode: widget.focusNode,
        obscureText: widget.obscureInput && !showPassword,
        enableSuggestions: !widget.obscureInput,
        autocorrect: !widget.obscureInput,
        textAlign: widget.inputTextAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        // cursorColor: AppColor.black,
        controller: _textEditingController,
        initialValue:
            _textEditingController != null ? null : widget.initialValue,
        keyboardType: widget.inputType,
        onChanged: widget.onInputChanged,
        onFieldSubmitted: widget.onInputSubmitted,
        validator: widget.inputValidator,
        style: AppTextTheme.inputTextStyleSecondary,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.inputAction,
        maxLines:
            widget.maxLines ?? InputTextFormFieldConstants.defaultMaxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          hintText: widget.hintString,
          hintStyle: AppTextTheme.inputHintStyleSecondary,
          contentPadding:
              InputTextFormFieldConstants.secondaryContentPadding.copyWith(
            right: widget.obscureInput
                ? LayoutConstants.dimen_48.w
                : LayoutConstants.dimen_16.w,
          ),
          border: _inputBorder,
        ),
      );

  Container _helperText() => Container(
        alignment: Alignment.centerLeft,
        height: InputTextFormFieldConstants.helperTextHeight,
        child: Row(
          children: [
            widget.showError
                ? Icon(
                    Icons.error_outline,
                    color: AppColor.errorRed,
                    size: LayoutConstants.dimen_12.r,
                  )
                : Container(),
            gap2(h: true),
            Text(
              widget.helperString ?? '',
              style: AppTextTheme.inputLabelStyle.copyWith(
                color: widget.showError ? AppColor.errorRed : null,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}
