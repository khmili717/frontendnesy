import 'package:flutter/material.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(AppConstants.primaryBlue),
          foregroundColor: const Color(AppConstants.white),
          elevation: 0,
          disabledBackgroundColor: const Color(AppConstants.textGray),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(AppConstants.white),
                  ),
                ),
              )
            : Center(
        
                child: Text(
                  text,
                  style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: AppConstants.fontSizeXLarge,
                  fontWeight: FontWeight.w600,
                ),
              )),
      ),
    );
  }
} 