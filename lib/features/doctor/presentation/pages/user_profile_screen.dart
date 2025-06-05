import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/doctor/presentation/providers/user_profile_provider.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:foresight_care/domain/entities/user.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _mdpController = TextEditingController();
  final _cinController = TextEditingController();
  final _telephoneController = TextEditingController();

  Gender? _selectedGender;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser?.id != null) {
      // Delay the provider modification to avoid StateNotifierListenerError
      Future(() {
        ref.read(userProfileProvider.notifier).loadUserProfile(currentUser!.id!);
      });
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _mdpController.dispose();
    _cinController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userProfileProvider);
    final currentUser = ref.watch(currentUserProvider);

    // Populate form when user data is loaded
    ref.listen<UserProfileState>(userProfileProvider, (previous, next) {
      if (next.user != null && previous?.user != next.user) {
        _populateForm(next.user!);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: const Color(0x1A000000),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF103459),
            size: 20,
          ),
          tooltip: 'Retour',
        ),
        title: const Text(
          'Mon Profil',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF103459),
          ),
        ),
        actions: [
          if (state.hasChanges)
            TextButton(
              onPressed: () => _resetForm(),
              child: const Text(
                'Annuler',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF717171),
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(state, currentUser),
      ),
    );
  }

  Widget _buildBody(UserProfileState state, User? currentUser) {
    if (state.isLoading) {
      return _buildLoadingState();
    }

    if (state.error != null && state.user == null) {
      return _buildErrorState(state.error!);
    }

    if (state.user == null) {
      return _buildEmptyState();
    }

    return _buildProfileForm(state, currentUser);
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF13A4AB)),
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            'Chargement du profil...',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF717171),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[400],
            ),
            const SizedBox(height: 16),
            const Text(
              'Erreur',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF103459),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loadUserProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13A4AB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Réessayer',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'Aucune donnée de profil disponible',
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xFF717171),
        ),
      ),
    );
  }

  Widget _buildProfileForm(UserProfileState state, User? currentUser) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Header avec rôle et informations
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  color: const Color(0xFFD6D6D6).withOpacity(0.15),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  state.user!.role == UserRole.medecin 
                    ? Icons.medical_services 
                    : Icons.admin_panel_settings,
                  size: 48,
                  color: const Color(0xFF13A4AB),
                ),
                const SizedBox(height: 12),
                Text(
                  '${state.user!.prenom} ${state.user!.nom}',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xFF103459),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getRoleDisplayName(state.user!.role),
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF13A4AB),
                  ),
                ),
              ],
            ),
          ),

          // Formulaire
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                      color: const Color(0xFFD6D6D6).withOpacity(0.15),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informations personnelles',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF103459),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Nom
                    _buildTextField(
                      controller: _nomController,
                      label: 'Nom',
                      icon: Icons.person_outline,
                      validator: (value) => ref.read(userProfileProvider.notifier).validateField('nom', value),
                      onChanged: (value) => _updateFormField(nom: value),
                    ),

                    const SizedBox(height: 16),

                    // Prénom
                    _buildTextField(
                      controller: _prenomController,
                      label: 'Prénom',
                      icon: Icons.person_outline,
                      validator: (value) => ref.read(userProfileProvider.notifier).validateField('prenom', value),
                      onChanged: (value) => _updateFormField(prenom: value),
                    ),

                    const SizedBox(height: 16),

                    // CIN
                    _buildTextField(
                      controller: _cinController,
                      label: 'CIN',
                      icon: Icons.badge_outlined,
                      keyboardType: TextInputType.number,
                      validator: (value) => ref.read(userProfileProvider.notifier).validateField('cin', value),
                      onChanged: (value) => _updateFormField(cin: int.tryParse(value)),
                    ),

                    const SizedBox(height: 16),

                    // Sexe
                    _buildGenderDropdown(),

                    const SizedBox(height: 16),

                    // Numéro de téléphone
                    _buildTextField(
                      controller: _telephoneController,
                      label: 'Numéro de téléphone (optionnel)',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                      validator: (value) => ref.read(userProfileProvider.notifier).validateField('numeroTelephone', value),
                      onChanged: (value) => _updateFormField(numeroTelephone: value),
                    ),

                    const SizedBox(height: 20),

                    const Divider(color: Color(0xFFE0E0E0)),
                    const SizedBox(height: 20),

                    const Text(
                      'Sécurité',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF103459),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Mot de passe
                    _buildPasswordField(),

                    const SizedBox(height: 24),

                    // Error message
                    if (state.error != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red[600], size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.error!,
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.red[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Bouton de mise à jour
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: state.hasChanges && !state.isUpdating 
                ? () => _updateProfile(currentUser?.id)
                : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13A4AB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBackgroundColor: Colors.grey[300],
                disabledForegroundColor: Colors.grey[600],
              ),
              child: state.isUpdating
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Mettre à jour le profil',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(
        fontFamily: 'League Spartan',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF393C3C),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFF717171),
        ),
        prefixIcon: Icon(icon, color: const Color(0xFF13A4AB)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red[400]!),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _mdpController,
      obscureText: _obscurePassword,
      validator: (value) => ref.read(userProfileProvider.notifier).validateField('mdp', value),
      onChanged: (value) => _updateFormField(mdp: value),
      style: const TextStyle(
        fontFamily: 'League Spartan',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF393C3C),
      ),
      decoration: InputDecoration(
        labelText: 'Nouveau mot de passe (optionnel)',
        labelStyle: const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFF717171),
        ),
        helperText: 'Laissez vide pour conserver le mot de passe actuel',
        helperStyle: const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0xFF717171),
        ),
        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF13A4AB)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xFF717171),
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red[400]!),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<Gender>(
      value: _selectedGender,
      onChanged: (Gender? value) {
        setState(() => _selectedGender = value);
        if (value != null) {
          _updateFormField(sexe: value);
        }
      },
      validator: (value) {
        if (value == null) {
          return 'Veuillez sélectionner un genre';
        }
        return null;
      },
      style: const TextStyle(
        fontFamily: 'League Spartan',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF393C3C),
      ),
      decoration: InputDecoration(
        labelText: 'Sexe',
        labelStyle: const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFF717171),
        ),
        prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF13A4AB)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
      items: Gender.values.map((Gender gender) {
        return DropdownMenuItem<Gender>(
          value: gender,
          child: Text(
            _getGenderDisplayName(gender),
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF393C3C),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _populateForm(User user) {
    _nomController.text = user.nom;
    _prenomController.text = user.prenom;
    _cinController.text = user.cin.toString();
    _telephoneController.text = user.numeroTelephone ?? '';
    _selectedGender = user.sexe;
    // Don't populate password field
    _mdpController.clear();
  }

  void _updateFormField({
    String? nom,
    String? prenom,
    String? mdp,
    int? cin,
    Gender? sexe,
    String? numeroTelephone,
  }) {
    ref.read(userProfileProvider.notifier).updateFormField(
      nom: nom,
      prenom: prenom,
      mdp: mdp,
      cin: cin,
      sexe: sexe,
      numeroTelephone: numeroTelephone,
    );
  }

  void _resetForm() {
    ref.read(userProfileProvider.notifier).resetForm();
    final state = ref.read(userProfileProvider);
    if (state.user != null) {
      _populateForm(state.user!);
    }
  }

  Future<void> _updateProfile(String? userId) async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur: ID utilisateur non disponible'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final success = await ref.read(userProfileProvider.notifier).updateProfile(userId);
    
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Profil mis à jour avec succès',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );

        // Navigate back to dashboard
        Navigator.of(context).pop();
      } else {
        // Error message is handled by the provider state
      }
    }
  }

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.medecin:
        return 'Médecin';
      case UserRole.secretaire:
        return 'Secrétaire';
      case UserRole.admin:
        return 'Administrateur';
    }
  }

  String _getGenderDisplayName(Gender gender) {
    switch (gender) {
      case Gender.homme:
        return 'Homme';
      case Gender.femme:
        return 'Femme';
    }
  }
} 