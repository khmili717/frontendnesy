import 'package:flutter/material.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

class UserFilterTabs extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const UserFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(AppConstants.white),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        border: Border.all(
          color: const Color(AppConstants.primaryBlueAccent),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              text: AppStrings.doctor,
              isSelected: selectedFilter == AppStrings.doctor,
              onTap: () => onFilterChanged(AppStrings.doctor),
              isLeft: true,
            ),
          ),
          Expanded(
            child: _buildTab(
              text: AppStrings.secretary,
              isSelected: selectedFilter == AppStrings.secretary,
              onTap: () => onFilterChanged(AppStrings.secretary),
              isLeft: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isLeft,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(AppConstants.primaryBlueAccent)
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(AppConstants.borderRadiusLarge) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(AppConstants.borderRadiusLarge) : Radius.zero,
            topRight: !isLeft ? const Radius.circular(AppConstants.borderRadiusLarge) : Radius.zero,
            bottomRight: !isLeft ? const Radius.circular(AppConstants.borderRadiusLarge) : Radius.zero,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected 
                  ? const Color(AppConstants.white)
                  : const Color(AppConstants.primaryBlueAccent),
            ),
          ),
        ),
      ),
    );
  }
} 