import 'package:flutter/material.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: AppConstants.fontSizeLarge,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 325, // Match Figma width
          height: 48, // Match Figma height
          decoration: BoxDecoration(
            color: const Color(AppConstants.white),
            border: Border.all(
              color: const Color(AppConstants.borderGray),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword && !isPasswordVisible,
            validator: validator,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: AppConstants.fontSizeMedium,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.textDark),
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: AppConstants.fontSizeMedium,
                fontWeight: FontWeight.w400,
                color: Color(AppConstants.textPlaceholder),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingMedium,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(AppConstants.textGray),
                        size: 20,
                      ),
                      onPressed: onTogglePasswordVisibility,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
} 