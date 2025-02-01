import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
import 'package:mizara/shared/widgets/custom_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...import 'package:mizara/features/auth/presentation/pages/reset_password_success_page.dart';
// ...existing code...

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Réinitialiser le mot de passe',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Votre nouveau mot de passe doit être différent des mots de passe précédemment utilisés',
                  style: AppTheme.subtitleStyle,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Nouveau mot de passe',
                  hint: '********',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nouveau mot de passe';
                    }
                    if (value.length < 8) {
                      return 'Le mot de passe doit contenir au moins 8 caractères';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: AppTheme.mutedTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Confirmez le mot de passe',
                  hint: '********',
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez confirmer votre mot de passe';
                    }
                    if (value != _passwordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppTheme.mutedTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => const ResetPasswordSuccessPage());
                    }
                  },
                  child: const Text('Vérifier le compte'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}