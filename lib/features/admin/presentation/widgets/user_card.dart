import 'package:flutter/material.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/features/admin/presentation/widgets/update_user_modal.dart';
import 'package:foresight_care/features/admin/presentation/widgets/archive_toggle_button.dart';

class UserCard extends StatelessWidget {
  final String prenom;
  final String nom;
  final String cin;
  final String password;
  final String gender;
  final String role;
  final User user;
  final VoidCallback onEdit;
  final VoidCallback onArchive;

  const UserCard({
    super.key,
    required this.prenom,
    required this.nom,
    required this.cin,
    required this.password,
    required this.gender,
    required this.role,
    required this.user,
    required this.onEdit,
    required this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      decoration: BoxDecoration(
        color: const Color(AppConstants.white),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUserInfo(),
            const SizedBox(height: 10),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
              children: [
              _buildInfoRow(AppStrings.prenomLabel, prenom),
              const SizedBox(height: 4),
              _buildInfoRow(AppStrings.nomLabel, nom),
                const SizedBox(height: 4),
                _buildInfoRow(AppStrings.cinLabel, cin),
                const SizedBox(height: 4),
                _buildInfoRow(AppStrings.passwordLabelShort, password),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
              children: [
                _buildInfoRow(AppStrings.genderLabel, gender),
                const SizedBox(height: 4),
                _buildInfoRow(AppStrings.roleLabel, role),
              ],
            ),
          ),
        ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.textDark),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(
          text: AppStrings.modify,
          backgroundColor: const Color(AppConstants.successGreenLight),
          textColor: const Color(AppConstants.successGreen),
          onPressed: () => _showUpdateUserModal(context),
        ),
        ArchiveToggleButton(
          userId: user.id!,
          isArchived: user.archived,
          onStatusChanged: (newStatus) {
            onArchive();
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 80,
      height: 25,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ),
    );
  }

  void _showUpdateUserModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return UpdateUserModal(user: user);
      },
    );
  }
} 