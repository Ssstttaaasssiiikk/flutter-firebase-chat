import 'package:flutter/material.dart';
import 'package:virtual/core/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool error;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.isPassword,
      required this.controller,
      required this.error});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        fillColor: widget.error ? Colors.red[100] : AppColors.greyInput,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: widget.error
              ? const BorderSide(color: Colors.red)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: widget.error
              ? const BorderSide(color: Colors.red, width: 2.0)
              : const BorderSide(color: Colors.grey, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}
