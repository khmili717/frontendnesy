import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/features/admin/presentation/widgets/add_user_modal.dart';

/// Button widget that triggers the Add User modal
/// Follows the exact Figma design specifications
class AddUserButton extends ConsumerWidget {
  const AddUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 360, // Match Figma width
      height: 57, // Match Figma height
      child: ElevatedButton(
        onPressed: () {
          _showAddUserModal(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(AppConstants.primaryBlueAccent),
          foregroundColor: const Color(AppConstants.white),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
        ),
        child: const Text(
          AppStrings.addUser,
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// Shows the Add User modal dialog
  void _showAddUserModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AddUserModal();
      },
    );
  }
} 