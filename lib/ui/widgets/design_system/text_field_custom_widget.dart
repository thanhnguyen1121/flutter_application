import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';

class TextFieldCustomWidget extends FormField<String> {
  final TextEditingController? textEditingController;
  final bool isPassword;
  final bool callDidChangeManual;

  TextFieldCustomWidget({
    super.key,
    super.initialValue,
    super.onSaved,
    super.validator,
    this.isPassword = false,
    this.textEditingController,
    String? hint,
    String? title,
    Widget? action,
    Color? hintColor,
    Color? styleColor,
    int? maxLines = 1,
    int? maxLength,
    bool? mEnable,
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
    EdgeInsets? contentPadding,
    bool? isRequired,
    TextStyle? titleStyle,
    VoidCallback? onTap,
    TextStyle? textStyle,
    double? height,
    Key? mKey,
    AutovalidateMode? mAutoValidateMode,
    Function(String?)? onSubmitted,
    this.callDidChangeManual = false,
  }) : super(
          autovalidateMode: mAutoValidateMode,
          builder: (stateFormField) {
            final state = stateFormField as TextFieldCustomWidgetState;
            return GestureDetector(
              onTap: () {
                onTap?.call();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null && floatingLabelBehavior == FloatingLabelBehavior.never)
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: titleStyle ?? state.context.appTheme.body14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            if (isRequired ?? false)
                              Text(
                                " * ",
                                style: state.context.appTheme.body14.copyWith(
                                  color: AppColors.colorEB2227,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          offset: const Offset(0, 8),
                          spreadRadius: 0,
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: TextField(
                      enabled: mEnable,
                      maxLines: maxLines,
                      maxLength: maxLength,
                      keyboardType: keyboardType,
                      onSubmitted: onSubmitted,
                      inputFormatters: textInputFormatter,
                      onEditingComplete: onEditingComplete,
                      focusNode: state.focusNode,
                      cursorColor: styleColor ?? AppColors.color2F2F2F,
                      obscureText: state.isPassword,
                      controller: state.textEditingController,
                      obscuringCharacter: '*',
                      textInputAction: textInputAction,
                      textAlign: TextAlign.justify,
                      onChanged: (value) {
                        state.didChange(value);
                        onChanged?.call(value);
                      },
                      cursorHeight: 16,
                      style: state.context.appTheme.body16.copyWith(height: 1),
                      decoration:
                          const InputDecoration().applyDefaults(Theme.of(state.context).inputDecorationTheme).copyWith(
                                labelText: floatingLabelBehavior != FloatingLabelBehavior.never ? title : null,
                                hintText: hint,
                                hintStyle:
                                    state.context.appTheme.body14.copyWith(color: AppColors.colorC8C8C8, height: 1.6),
                                filled: true,
                                fillColor: mEnable == true || mEnable == null || onTap != null
                                    ? AppColors.white
                                    : AppColors.colorDBE0E6,
                                errorStyle: const TextStyle(
                                  height: 0.01,
                                  color: Colors.transparent,
                                ),
                                floatingLabelBehavior: floatingLabelBehavior,
                                counterStyle: state.context.appTheme.body10.copyWith(
                                  color: Colors.transparent,
                                  height: double.minPositive,
                                ),
                                // isDense: true,
                                counterText: "",
                                contentPadding: contentPadding ??
                                    const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 16,
                                    ),
                                suffixIconConstraints: const BoxConstraints(minHeight: 40, minWidth: 40),
                                suffixIcon: isPassword
                                    ? Padding(
                                        padding: const EdgeInsets.only(right: 24, left: 4),
                                        child: InkWell(
                                          onTap: () {
                                            state.showOrHidePassword();
                                          },
                                          child: Icon(
                                            state.isPassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
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
                                prefixIconConstraints: const BoxConstraints(minHeight: 40, minWidth: 40),
                                prefixIcon: prefixIcon != null
                                    ? Padding(
                                        padding: const EdgeInsets.only(left: 16, right: 4),
                                        child: prefixIcon,
                                      )
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                    ),
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
  FormFieldState<String> createState() => TextFieldCustomWidgetState();
}

class TextFieldCustomWidgetState extends FormFieldState<String> {
  late bool isPassword;
  FocusNode focusNode = FocusNode();
  late TextEditingController textEditingController;
  late bool callDidChangeManual;

  @override
  TextFieldCustomWidget get widget => super.widget as TextFieldCustomWidget;

  @override
  void initState() {
    super.initState();
    isPassword = widget.isPassword;
    textEditingController = widget.textEditingController ?? TextEditingController(text: widget.initialValue);
    callDidChangeManual = widget.callDidChangeManual;
    textEditingController.addListener(() {
      if (callDidChangeManual) {
        didChange(textEditingController.text);
      }
    });
  }

  void showOrHidePassword() {
    isPassword = !isPassword;
    setState(() {});
  }
}
