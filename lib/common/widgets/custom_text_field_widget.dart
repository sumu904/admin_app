import 'package:flutter/material.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/styles.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String titleText;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool isPassword;

  const CustomTextFieldWidget({
    super.key,
    required this.titleText,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titleText, style: robotoBold.copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),

        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.5)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
            filled: true,
            fillColor: Theme.of(context).disabledColor.withOpacity(0.15),
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 20, color: Theme.of(context).disabledColor) : null,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, size: 20, color: Theme.of(context).hintColor.withOpacity(0.3)),
              onPressed: _toggle,
            ) : null,
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
