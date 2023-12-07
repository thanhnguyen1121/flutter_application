import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';

class TextFieldCustomInnerWidget extends FormField<String> {
  final TextEditingController? controller;
  final bool isPassword;
  final bool callDidChangeManual;
  final FocusNode? node;

  TextFieldCustomInnerWidget({
    super.key,
    super.onSaved,
    super.initialValue,
    super.validator,
    this.controller,
    this.isPassword = false,
    this.callDidChangeManual = false,
    this.node,
    String? hint,
    String? title,
    Widget? action,
    Color? hintColor,
    Color? styleColor,
    int? maxLines,
    int? maxLength = 1000,
    bool? require,
    bool? enable,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    List<TextInputFormatter>? textInputFormatter,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never,
    Color? backgroundColor,
    String? description,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool enableTextError = true,
    AutovalidateMode? autoValidateMode,
    VoidCallback? onPressed,
  }) : super(
          autovalidateMode: autoValidateMode,
          builder: (state) {
            final myState = state as TextFieldCustomInnerWidgetState;
            return GestureDetector(
              onTap: () {
                if (enable == false) {
                  onPressed?.call();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null) ...[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: myState.context.appTheme.body14B.copyWith(
                              color: AppColors.color565656,
                            ),
                          ),
                          if (require == true)
                            TextSpan(
                              text: " *",
                              style: myState.context.appTheme.body14B.copyWith(
                                color: AppColors.colorEB2227,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  StreamBuilder<bool>(
                    stream: myState.inputColorCtrl.stream.distinct(),
                    initialData: false,
                    builder: (context, snapshot) {
                      final hasFocus = snapshot.requireData;
                      return Container(
                        height: 48 + 16 * (maxLines ?? 0).toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: hasFocus
                                  ? AppColors.focusInputColor.withOpacity(0.2)
                                  : AppColors.inputInnerShadow.withOpacity(0.1),
                            ),
                            const BoxShadow(
                              color: AppColors.white,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              spreadRadius: -1,
                              blurStyle: BlurStyle.inner,
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            if (prefixIcon != null) ...[
                              prefixIcon,
                              const SizedBox(
                                width: 4,
                              )
                            ],
                            Expanded(
                              child: TextField(
                                enabled: enable,
                                maxLines: maxLines ?? 1,
                                focusNode: myState.focusNode,
                                cursorColor: AppColors.black,
                                obscureText: state.isPassword,
                                controller: state.textEditingController,
                                obscuringCharacter: '*',
                                textAlign: TextAlign.justify,
                                keyboardType: keyboardType,
                                textInputAction: textInputAction,
                                onChanged: (value) {
                                  state.didChange(value);
                                  onChanged?.call(value);
                                },
                                style: myState.context.appTheme.body16.copyWith(
                                  height: 1.2,
                                ),
                                decoration: const InputDecoration()
                                    .applyDefaults(Theme.of(myState.context).inputDecorationTheme)
                                    .copyWith(
                                      hintText: hint,
                                      suffixIcon: isPassword
                                          ? Padding(
                                              padding: const EdgeInsets.only(right: 0, left: 4),
                                              child: InkWell(
                                                onTap: () {
                                                  state.showOrHidePassword();
                                                },
                                                child: Icon(
                                                  state.isPassword
                                                      ? Icons.remove_red_eye
                                                      : Icons.remove_red_eye_outlined,
                                                  size: 20,
                                                  color: AppColors.color969FA7,
                                                ),
                                              ),
                                            )
                                          : suffixIcon != null
                                              ? Padding(
                                                  padding: const EdgeInsets.only(
                                                    right: 24,
                                                  ),
                                                  child: suffixIcon,
                                                )
                                              : null,
                                      hintStyle: myState.context.appTheme.body16.copyWith(
                                        color: AppColors.inputHintColor,
                                      ),
                                      errorStyle: myState.context.appTheme.body10
                                          .copyWith(height: 0.01, color: Colors.transparent),
                                      floatingLabelBehavior: floatingLabelBehavior,
                                      contentPadding:
                                          const EdgeInsets.symmetric(horizontal: 0, vertical: 0).copyWith(top: 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                      ),
                                      errorText: myState.errorText,
                                    ),
                              ),
                            ),
                            if (suffixIcon != null) ...[
                              const SizedBox(
                                width: 4,
                              ),
                              suffixIcon,
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: enableTextError && state.hasError
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.errorText ?? '',
                                      style: state.context.appTheme.body12.copyWith(
                                        height: 1,
                                        color: AppColors.colorEB2227,
                                      ),
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            );
          },
        );

  @override
  FormFieldState<String> createState() => TextFieldCustomInnerWidgetState();
}

class TextFieldCustomInnerWidgetState extends FormFieldState<String> {
  late bool isPassword;
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  late bool callDidChangeManual;

  @override
  TextFieldCustomInnerWidget get widget => super.widget as TextFieldCustomInnerWidget;

  final inputColorCtrl = StreamController<bool>.broadcast();

  @override
  void initState() {
    super.initState();
    focusNode = widget.node ?? FocusNode();
    isPassword = widget.isPassword;
    textEditingController = widget.controller ?? TextEditingController(text: widget.initialValue);
    callDidChangeManual = widget.callDidChangeManual;
    textEditingController.addListener(() {
      if (callDidChangeManual) {
        didChange(textEditingController.text);
      }
    });
    focusNode.addListener(focusNodeListener);
  }

  @override
  void dispose() {
    focusNode.removeListener(focusNodeListener);
    super.dispose();
  }

  void focusNodeListener() {
    inputColorCtrl.sink.add(focusNode.hasFocus);
  }

  void showOrHidePassword() {
    isPassword = !isPassword;
    setState(() {});
  }
}
