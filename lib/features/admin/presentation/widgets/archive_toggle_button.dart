import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/features/admin/presentation/providers/archive_user_provider.dart';

/// Toggle button for archiving/unarchiving users
/// Displays "Archive" or "Unarchive" based on current user status
/// Handles API calls and provides visual feedback
class ArchiveToggleButton extends ConsumerStatefulWidget {
  /// User ID for the archive/unarchive operations
  final String userId;
  
  /// Current archived status of the user
  final bool isArchived;
  
  /// Optional callback when status changes successfully
  final void Function(bool newArchivedStatus)? onStatusChanged;
  
  /// Optional custom width for the button
  final double? width;
  
  /// Optional custom height for the button
  final double? height;

  const ArchiveToggleButton({
    super.key,
    required this.userId,
    required this.isArchived,
    this.onStatusChanged,
    this.width,
    this.height,
  });

  @override
  ConsumerState<ArchiveToggleButton> createState() => _ArchiveToggleButtonState();
}

class _ArchiveToggleButtonState extends ConsumerState<ArchiveToggleButton> {
  /// Local state to track archived status for immediate UI updates
  late bool _currentArchivedStatus;

  @override
  void initState() {
    super.initState();
    _currentArchivedStatus = widget.isArchived;
  }

  @override
  void didUpdateWidget(ArchiveToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update local state if the parent widget's isArchived changes
    if (oldWidget.isArchived != widget.isArchived) {
      _currentArchivedStatus = widget.isArchived;
    }
  }

  @override
  Widget build(BuildContext context) {
    final archiveState = ref.watch(archiveUserProvider);

    return SizedBox(
      width: widget.width ?? 80,
      height: widget.height ?? 25,
      child: ElevatedButton(
        onPressed: archiveState.isLoading ? null : _onTogglePressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(),
          foregroundColor: _getTextColor(),
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
        ),
        child: archiveState.isLoading
            ? SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getButtonIcon(),
                    size: 12,
                    color: _getTextColor(),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getButtonText(),
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: _getTextColor(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// Gets the appropriate button color based on current archived status
  Color _getButtonColor() {
    return _currentArchivedStatus
        ? const Color(AppConstants.successGreenLight) // Unarchive action (green)
        : const Color(AppConstants.errorRedLight); // Archive action (red)
  }

  /// Gets the appropriate text color based on current archived status
  Color _getTextColor() {
    return _currentArchivedStatus
        ? const Color(AppConstants.successGreen) // Unarchive action (green)
        : const Color(AppConstants.errorRedDark); // Archive action (red)
  }

  /// Gets the appropriate button text based on current archived status
  String _getButtonText() {
    return _currentArchivedStatus ? 'Réactiver' : 'Archiver';
  }

  /// Gets the appropriate button icon based on current archived status
  IconData _getButtonIcon() {
    return _currentArchivedStatus ? Icons.unarchive : Icons.archive;
  }

  /// Handles the toggle button press
  void _onTogglePressed() async {
    final archiveNotifier = ref.read(archiveUserProvider.notifier);
    bool success = false;

    if (_currentArchivedStatus) {
      // User is currently archived, so unarchive them
      success = await archiveNotifier.unarchiveUser(widget.userId);
    } else {
      // User is currently active, so archive them
      success = await archiveNotifier.archiveUser(widget.userId);
    }

    if (success && mounted) {
      // Update local state immediately for responsive UI
      setState(() {
        _currentArchivedStatus = !_currentArchivedStatus;
      });

      // Notify parent widget of the status change
      widget.onStatusChanged?.call(_currentArchivedStatus);

      // Show success message
      _showSuccessSnackBar();
    } else if (mounted) {
      // Show error message
      final errorMessage = ref.read(archiveUserProvider).error;
      if (errorMessage != null) {
        _showErrorSnackBar(errorMessage);
      }
    }
  }

  /// Shows success snackbar message
  void _showSuccessSnackBar() {
    final message = _currentArchivedStatus
        ? 'Utilisateur archivé avec succès'
        : 'Utilisateur restauré avec succès';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.white),
          ),
        ),
        backgroundColor: const Color(AppConstants.successGreen),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
        ),
      ),
    );
  }

  /// Shows error snackbar message
  void _showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.white),
          ),
        ),
        backgroundColor: const Color(AppConstants.errorRed),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
        ),
        action: SnackBarAction(
          label: 'Fermer',
          textColor: const Color(AppConstants.white),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
} 