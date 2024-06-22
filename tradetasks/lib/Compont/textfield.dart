import 'package:flutter/material.dart';
import 'package:tradetasks/Compont/colors.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator; // Add validator parameter

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.label,
    this.validator, // Make validator optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField( // Use TextFormField for validation
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightCyan,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightCyan, width: 2.0),
              ),
              fillColor: AppColors.primaryColor,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.lightCyan,
                fontSize: 10,
              ),
            ),
            validator: validator, // Pass validator to TextFormField
          ),
        ),
      ],
    );
  }
}
