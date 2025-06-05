import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/core/routes/app_router.dart';
import 'package:foresight_care/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:foresight_care/features/auth/presentation/widgets/primary_button.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:foresight_care/domain/entities/user.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _cinController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _cinController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    // Listen to auth state changes
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: const Color(AppColors.error),
          ),
        );
      } else if (next.isAuthenticated && next.user != null) {
        // Navigate based on user role
        final user = next.user!;
        print(user.role);
        switch (user.role) {
          case UserRole.admin:
            context.go(AppRoutes.adminDashboard);
            break;
          case UserRole.medecin:
            context.go(AppRoutes.doctorDashboard);
            break;
          case UserRole.secretaire:
            context.go(AppRoutes.secretaryDashboard);
            break;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Color(AppColors.success),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(AppColors.background),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.5),
            child: Column(
              children: [
                const SizedBox(height: 219), // Match Figma spacing
                _buildHeader(),
                const SizedBox(height: 45), // Match Figma spacing
                _buildLoginForm(isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          AppStrings.loginTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: const Color(AppColors.primaryBlue),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppStrings.loginSubtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(AppColors.primaryTeal),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildFormFields(),
          const SizedBox(height: 32),
          _buildLoginButton(isLoading),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        CustomTextField(
          controller: _cinController,
          label: 'CIN',
          placeholder: 'Entrez votre CIN',
          keyboardType: TextInputType.number,
          validator: _validateCin,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _passwordController,
          label: AppStrings.password,
          placeholder: AppStrings.passwordPlaceholder,
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onTogglePasswordVisibility: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          validator: _validatePassword,
        ),
        // const SizedBox(height: 16),
        // _buildForgotPassword(),
      ],
    );
  }

  // Widget _buildForgotPassword() {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: TextButton(
  //       onPressed: () {
  //         // TODO: Implement forgot password
  //       },
  //       style: TextButton.styleFrom(
  //         padding: EdgeInsets.zero,
  //         minimumSize: Size.zero,
  //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //       ),
  //       child: Text(
  //         AppStrings.forgotPassword,
  //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w400,
  //           color: const Color(AppColors.lightText),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLoginButton(bool isLoading) {
    return PrimaryButton(
      text: AppStrings.login,
      onPressed: isLoading ? null : _handleLogin,
      isLoading: isLoading,
      width: 325, // Match Figma width
      height: 55, // Match Figma height
    );
  }

  String? _validateCin(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    // CIN should be 8 digits
    if (value.length != 8) {
      return 'CIN doit contenir 8 chiffres';
    }

    // Check if all characters are digits
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'CIN doit contenir uniquement des chiffres';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value.length < AppConstants.minPasswordLength) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Clear any previous errors
    ref.read(authProvider.notifier).clearError();

    // Parse CIN to integer
    final cin = int.parse(_cinController.text);
    final password = _passwordController.text;

    // Call login
    await ref.read(authProvider.notifier).login(cin, password);
  }
}
