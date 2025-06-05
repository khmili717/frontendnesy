import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/features/admin/presentation/widgets/archive_toggle_button.dart';

/// Demo widget to showcase ArchiveToggleButton functionality
/// This can be used for testing and demonstrating the toggle button
class ArchiveToggleButtonDemo extends ConsumerWidget {
  const ArchiveToggleButtonDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundGray),
      appBar: AppBar(
        title: const Text('Archive Toggle Button Demo'),
        backgroundColor: const Color(AppConstants.primaryBlueAccent),
        foregroundColor: const Color(AppConstants.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Archive Toggle Button Examples',
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(AppConstants.primaryBlueAccent),
                ),
              ),
              const SizedBox(height: 30),
              
              // Demo cards showing different states
              _buildDemoCard(
                title: 'Active User (Not Archived)',
                description: 'Shows "Archive" button with red styling',
                child: ArchiveToggleButton(
                  userId: 'demo-user-1',
                  isArchived: false,
                  onStatusChanged: (newStatus) {
                    _showStatusChangeDialog(context, 'Demo User 1', newStatus);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              _buildDemoCard(
                title: 'Archived User',
                description: 'Shows "Réactiver" button with green styling',
                child: ArchiveToggleButton(
                  userId: 'demo-user-2',
                  isArchived: true,
                  onStatusChanged: (newStatus) {
                    _showStatusChangeDialog(context, 'Demo User 2', newStatus);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              _buildDemoCard(
                title: 'Custom Size Button',
                description: 'Larger button with custom dimensions',
                child: ArchiveToggleButton(
                  userId: 'demo-user-3',
                  isArchived: false,
                  width: 120,
                  height: 40,
                  onStatusChanged: (newStatus) {
                    _showStatusChangeDialog(context, 'Demo User 3', newStatus);
                  },
                ),
              ),
              const SizedBox(height: 30),
              
              const Text(
                'Features Demonstrated:',
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(AppConstants.textDark),
                ),
              ),
              const SizedBox(height: 10),
              
              _buildFeatureList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemoCard({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(AppConstants.textDark),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.textSecondary),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureList() {
    final features = [
      '• Dynamic text and icon based on archived status',
      '• Color-coded visual feedback (red for archive, green for unarchive)',
      '• Loading state with spinner during API calls',
      '• Error handling with user-friendly messages',
      '• Success notifications via SnackBar',
      '• Customizable button dimensions',
      '• Parent widget notification via callback',
      '• Disabled state during operations',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features.map((feature) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          feature,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
          ),
        ),
      )).toList(),
    );
  }

  void _showStatusChangeDialog(BuildContext context, String userName, bool newStatus) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Status Changed',
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          '$userName is now ${newStatus ? "archived" : "active"}',
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 