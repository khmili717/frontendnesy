import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/features/admin/presentation/providers/update_user_provider.dart';
import 'package:foresight_care/features/admin/presentation/providers/users_provider.dart' show usersProvider;

/// Modal dialog for updating an existing user
/// Follows the exact Figma design specifications
class UpdateUserModal extends ConsumerStatefulWidget {
  final User user;

  const UpdateUserModal({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<UpdateUserModal> createState() => _UpdateUserModalState();
}

class _UpdateUserModalState extends ConsumerState<UpdateUserModal> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _mdpController = TextEditingController();
  final _cinController = TextEditingController();
  final _numeroTelephoneController = TextEditingController();
  
  String? _selectedRole;
  String? _selectedSexe;
  bool _archived = false;

  // Role options as per API specification
  final List<String> _roleOptions = ['medecin', 'secretaire'];
  final List<String> _sexeOptions = ['homme', 'femme'];

  // Track original values to detect changes
  late final Map<String, dynamic> _originalValues;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    // Pre-populate form with existing user data
    _nomController.text = widget.user.nom;
    _prenomController.text = widget.user.prenom;
    _cinController.text = widget.user.cin.toString();
    _numeroTelephoneController.text = widget.user.numeroTelephone ?? '';
    
    _selectedRole = widget.user.role.name;
    _selectedSexe = widget.user.sexe.name;
    _archived = widget.user.archived;

    // Store original values for change detection
    _originalValues = {
      'nom': widget.user.nom,
      'prenom': widget.user.prenom,
      'cin': widget.user.cin,
      'role': widget.user.role.name,
      'sexe': widget.user.sexe.name,
      'numero_telephone': widget.user.numeroTelephone,
      'archived': widget.user.archived,
    };
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _mdpController.dispose();
    _cinController.dispose();
    _numeroTelephoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateUserState = ref.watch(updateUserProvider);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 365, // Match Figma width (333 + 32 padding)
        height: 601, // Match Figma height
        decoration: BoxDecoration(
          color: const Color(AppConstants.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 6),
              blurRadius: 12,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              offset: const Offset(0, 22),
              blurRadius: 22,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 51),
              blurRadius: 30,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              offset: const Offset(0, 90),
              blurRadius: 36,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Close button
            Positioned(
              top: 5,
              left: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close_rounded,
                  color: Color(AppConstants.primaryBlueAccent),
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                children: [
                  // Title
                  _buildTitle(),
                  const SizedBox(height: 10),
                  // Form
                  Expanded(
                    child: _buildForm(updateUserState),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the modal title
  Widget _buildTitle() {
    return const Text(
      'Modifier',
      style: TextStyle(
        fontFamily: 'LeagueSpartan',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1A85AB), // Match Figma color
        height: 0.92,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the form content
  Widget _buildForm(UpdateUserState updateUserState) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          width: 333, // Match Figma form width
          child: Column(
            children: [
              // Nom field
              _buildFormField(
                label: 'Nom',
                controller: _nomController,
                placeholder: 'Veuillez entrer le nom',
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty && value.trim().length < 2) {
                    return 'Le nom doit contenir au moins 2 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Prénom field
              _buildFormField(
                label: 'Prénom',
                controller: _prenomController,
                placeholder: 'Veuillez entrer le prénom',
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty && value.trim().length < 2) {
                    return 'Le prénom doit contenir au moins 2 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // CIN field
              _buildFormField(
                label: 'CIN',
                controller: _cinController,
                placeholder: 'Veuillez entrer le CIN/CNAM',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    if (int.tryParse(value) == null) {
                      return 'Le CIN doit être un nombre valide';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Mot de passe field (optional for updates)
              _buildFormField(
                label: 'Nouveau mot de passe (optionnel)',
                controller: _mdpController,
                placeholder: 'Laisser vide pour conserver le mot de passe actuel',
                obscureText: true,
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Sexe dropdown
              _buildDropdownField(
                label: 'Sexe',
                value: _selectedSexe,
                items: _sexeOptions,
                onChanged: (value) => setState(() => _selectedSexe = value),
              ),
              const SizedBox(height: 20),
              
              // Role dropdown
              _buildDropdownField(
                label: 'Role',
                value: _selectedRole,
                items: _roleOptions,
                onChanged: (value) => setState(() => _selectedRole = value),
              ),
              const SizedBox(height: 20),
              
              // Numéro de téléphone field (optional)
              _buildFormField(
                label: 'Numéro de téléphone (optionnel)',
                controller: _numeroTelephoneController,
                placeholder: 'Veuillez entrer le numéro de téléphone',
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length != 8) {
                    return 'Le numéro de téléphone doit contenir exactement 8 chiffres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Archived checkbox
              _buildArchivedCheckbox(),
              const SizedBox(height: 20),
              
              // Submit button
              _buildSubmitButton(updateUserState),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a form field with label and input
  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        // Input field
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textDark),
            height: 1.4,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.textPlaceholder),
              height: 1.4,
            ),
            filled: true,
            fillColor: const Color(AppConstants.backgroundGray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.borderGray),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.borderGray),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.primaryBlueAccent),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.errorRed),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a dropdown field with label
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        // Dropdown field
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textDark),
            height: 1.4,
          ),
          decoration: InputDecoration(
            hintText: 'En attente',
            hintStyle: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.textPlaceholder),
              height: 1.4,
            ),
            filled: true,
            fillColor: const Color(AppConstants.backgroundGray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.borderGray),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.borderGray),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.primaryBlueAccent),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppConstants.errorRed),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                _getDisplayName(item),
                style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(AppConstants.textDark),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  /// Builds the archived checkbox
  Widget _buildArchivedCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _archived,
          onChanged: (value) => setState(() => _archived = value ?? false),
          activeColor: const Color(AppConstants.primaryBlueAccent),
        ),
        const SizedBox(width: 8),
        const Text(
          'Compte archivé',
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textSecondary),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  /// Builds the submit button
  Widget _buildSubmitButton(UpdateUserState updateUserState) {
    return SizedBox(
      height: 56, // Match Figma button height
      child: ElevatedButton(
        onPressed: updateUserState.isLoading ? null : _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A85AB), // Match Figma color
          foregroundColor: const Color(AppConstants.white),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: updateUserState.isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                'Enregistrer',
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  /// Gets display name for dropdown items
  String _getDisplayName(String value) {
    switch (value) {
      case 'homme':
        return 'Homme';
      case 'femme':
        return 'Femme';
      case 'medecin':
        return 'Médecin';
      case 'secretaire':
        return 'Secrétaire';
      default:
        return value;
    }
  }

  /// Gets changed values only
  Map<String, dynamic> _getChangedValues() {
    final changedValues = <String, dynamic>{};

    // Check each field for changes
    final currentNom = _nomController.text.trim();
    if (currentNom != _originalValues['nom'] && currentNom.isNotEmpty) {
      changedValues['nom'] = currentNom;
    }

    final currentPrenom = _prenomController.text.trim();
    if (currentPrenom != _originalValues['prenom'] && currentPrenom.isNotEmpty) {
      changedValues['prenom'] = currentPrenom;
    }

    final currentCin = _cinController.text.trim();
    if (currentCin.isNotEmpty && int.tryParse(currentCin) != _originalValues['cin']) {
      changedValues['cin'] = int.parse(currentCin);
    }

    final currentMdp = _mdpController.text.trim();
    if (currentMdp.isNotEmpty) {
      changedValues['mdp'] = currentMdp;
    }

    if (_selectedRole != _originalValues['role']) {
      changedValues['role'] = _selectedRole;
    }

    if (_selectedSexe != _originalValues['sexe']) {
      changedValues['sexe'] = _selectedSexe;
    }

    final currentPhone = _numeroTelephoneController.text.trim();
    if (currentPhone != (_originalValues['numero_telephone'] ?? '')) {
      changedValues['numero_telephone'] = currentPhone.isEmpty ? null : currentPhone;
    }

    if (_archived != _originalValues['archived']) {
      changedValues['archived'] = _archived;
    }

    return changedValues;
  }

  /// Submits the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final changedValues = _getChangedValues();

      if (changedValues.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Aucune modification détectée'),
            backgroundColor: Color(AppConstants.textGray),
          ),
        );
        return;
      }

      ref.read(updateUserProvider.notifier).updateUser(widget.user.id!, changedValues).then((success) async{
        if (success && mounted) {
                    await ref.read(usersProvider.notifier).refreshUsers();

          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Utilisateur modifié avec succès'),
              backgroundColor: Color(AppConstants.successGreen),
            ),
          );
        }
      });
    }
  }
} 