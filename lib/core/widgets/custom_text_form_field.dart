import 'package:flutter/material.dart';
import 'package:sebs_app/core/functions/validate_required_field.dart';
import 'package:sebs_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.suffixIcon,
    required this.prefixIcon,
    this.onSaved,
    this.borderColor = AppColors.textFieldColor,
    this.borderRaduis = 12,
    this.contentPadding = const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 18),
    this.autofocus = false,
    this.onFieldSubmitted,
    this.validator,
    this.isPassword = false,
  });

  final int maxLines;
  final Color borderColor;
  final double borderRaduis;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final Function(String?)? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator ?? (value) => validateRequiredField(value, widget.hint),
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscureText : false, // <-- important!
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  size: 20,
                  color: AppColors.hintColorTextField,
                ),
              )
            : widget.suffixIcon != null
                ? IconButton(
                    onPressed: widget.onPressed,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        widget.suffixIcon,
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: Icon(
            widget.prefixIcon,
            color: AppColors.hintColorTextField,
            size: 20,
          ),
        ),
        contentPadding: widget.contentPadding,
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.hintColorTextField),
        labelText: widget.hint,
        labelStyle: TextStyle(color: AppColors.hintColorTextField),
        border: buildBorder(),
        enabledBorder: buildBorder(color: widget.borderColor),
        focusedBorder: buildBorder(color: widget.borderColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRaduis),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
