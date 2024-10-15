import 'package:flutter/material.dart';
import 'package:virtual/core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Text(text, style: const TextStyle(color: AppColors.white))),
    );
  }
}
