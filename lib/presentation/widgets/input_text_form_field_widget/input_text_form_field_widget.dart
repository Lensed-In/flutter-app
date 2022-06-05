import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/themes/app_text_themes.dart';

import 'input_text_form_field_constants.dart';

// ignore: must_be_immutable
class InputTextFormField extends StatefulWidget {
  final GlobalKey<FormState>? formStateKey;
  final bool showError;
  final bool obscureInput;
  final String? labelString;
  final String? hintString;
  String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String?)? onInputChanged;
  final Function(String?)? onInputSubmitted;
  final String Function(String?)? inputValidator;
  final Decoration? decoration;
  final Widget? prefix;
  final Widget? suffix;
  String? helperString;
  final int? minLines;
  final int? maxLines;
  final bool? multiLine;
  final TextAlign? inputTextAlign;
  final TextInputAction? inputAction;
  final bool enabled;
  final GestureTapCallback? onTap;

  InputTextFormField({
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
    this.prefix,
    this.suffix,
    this.decoration,
    this.minLines,
    this.maxLines,
    this.multiLine = false,
    this.inputTextAlign,
    this.inputAction,
    this.enabled = true,
    this.onTap,
  }) : super(key: key) {
    this.helperString = helperString ?? '';
  }

  @override
  State<StatefulWidget> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  TextEditingController? _textEditingController;
  InputBorder? _inputBorder;
  InputBorder? _enabledInputBorder;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller;
    _inputBorder = OutlineInputBorder(
      borderRadius: InputTextFormFieldConstants.textFieldBorderRadius,
    );
    _enabledInputBorder = OutlineInputBorder(
        borderRadius: InputTextFormFieldConstants.textFieldBorderRadius,
        borderSide: BorderSide(
          color: AppColor.grey25,
        ));

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
  Widget build(BuildContext context) => _inputField();

  TextFormField _inputField() => TextFormField(
        autofocus: false,
        enabled: widget.enabled,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        obscureText: widget.obscureInput,
        textAlign: widget.inputTextAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        // cursorColor: AppColor.black,
        controller: _textEditingController,
        initialValue:
            _textEditingController != null ? null : widget.initialValue,
        keyboardType: widget.multiLine == true
            ? TextInputType.multiline
            : widget.inputType,
        onChanged: widget.onInputChanged,
        onFieldSubmitted: widget.onInputSubmitted,
        validator: widget.inputValidator,
        style: AppTextTheme.inputTextStyle,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.multiLine == true
            ? TextInputAction.newline
            : widget.inputAction,
        minLines:
            widget.minLines ?? InputTextFormFieldConstants.defaultMinLines,
        maxLines: widget.multiLine == true
            ? null
            : widget.maxLines ?? InputTextFormFieldConstants.defaultMaxLines,
        textCapitalization: widget.inputType != TextInputType.emailAddress ? TextCapitalization.sentences : TextCapitalization.none,
        decoration: InputDecoration(
            filled: true,
            labelText: widget.labelString,
            labelStyle: AppTextTheme.inputLabelStyleNew,
            alignLabelWithHint: true,
            fillColor: AppColor.transparent,
            hintText: widget.hintString,
            hintStyle: AppTextTheme.inputHintStyle,
            contentPadding: InputTextFormFieldConstants.secondaryContentPadding,
            border: _inputBorder,
            enabledBorder: _enabledInputBorder,
            // focusColor: AppColor.black,
            prefixIcon: widget.prefix,
            suffixIcon: widget.suffix,
            errorText: widget.showError ? widget.helperString : null,
            errorStyle: AppTextTheme.inputLabelStyle.copyWith(
              color: widget.showError
                  ? AppColor.primaryColor
                  : AppColor.grey25,
              fontWeight: FontWeight.normal,
            )),
      );
}
