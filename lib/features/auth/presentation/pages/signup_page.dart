import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/shared/widgets/custom_text_field.dart';
import 'package:mizara/shared/widgets/social_button.dart';
import 'package:mizara/features/auth/presentation/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nomCompletController = TextEditingController();
  final _prenomController = TextEditingController();
  final _numeroTelephoneController = TextEditingController();
  final _lieuHabitationController = TextEditingController();
  bool _obscurePassword = true;
  bool _acceptTerms = false;

  bool _isLoading = false;

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate() || !_acceptTerms) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http
          .post(
            Uri.parse('http://127.0.0.1:8000/register/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'nom_complet': _nomCompletController.text,
              'prenom': _prenomController.text,
              'numero_telephone': _numeroTelephoneController.text,
              'email': _emailController.text,
              'lieu_habitation': _lieuHabitationController.text,
              'username': _usernameController.text,
              'password': _passwordController.text,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        Get.snackbar('Succès', 'Inscription réussie');
        Get.offAll(() => const LoginPage());
      } else {
        Get.snackbar(
            'Erreur', 'Erreur lors de l\'inscription: ${response.body}');
      }
    } on http.ClientException catch (e) {
      Get.snackbar('Erreur réseau', 'Impossible de se connecter au serveur');
    } on TimeoutException catch (e) {
      Get.snackbar('Erreur', 'Le serveur met trop de temps à répondre');
    } catch (e) {
      Get.snackbar(
          'Erreur', 'Une erreur inattendue s\'est produite: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Stocker le token ici (à implémenter)
        Get.snackbar('Succès', 'Connexion réussie');
        // Rediriger vers la page d'accueil
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Erreur', 'Email ou mot de passe incorrect');
      }
    }
  }

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
                  'Créez votre nouveau compte',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Créez un compte pour commencer à rechercher le riz et les produits alimentaires que vous aimez.',
                  style: AppTheme.subtitleStyle,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Nom complet',
                  hint: 'Entrez votre nom complet',
                  controller: _nomCompletController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom complet';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Prénom',
                  hint: 'Entrez votre prénom',
                  controller: _prenomController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Numéro de téléphone',
                  hint: 'Entrez votre numéro de téléphone',
                  controller: _numeroTelephoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre numéro de téléphone';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Adresse email',
                  hint: 'Entrez votre e-mail',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre email';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Lieu d\'habitation',
                  hint: 'Entrez votre lieu d\'habitation',
                  controller: _lieuHabitationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre lieu d\'habitation';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Nom d\'utilisateur',
                  hint: 'Entrez votre nom d\'utilisateur',
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom d\'utilisateur';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Mot de passe',
                  hint: 'Entrez votre mot de passe',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    if (value.length < 8) {
                      return 'Le mot de passe doit contenir au moins 8 caractères';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                  hint: 'Entrez à nouveau votre mot de passe',
                  controller: _confirmPasswordController,
                  obscureText: _obscurePassword,
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
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value!;
                        });
                      },
                      activeColor: AppTheme.primaryColor,
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: 'J\'accepte les ',
                          style: AppTheme.subtitleStyle,
                          children: [
                            TextSpan(
                              text: 'conditions d\'utilisation',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: ' et la '),
                            TextSpan(
                              text: 'politique de confidentialité',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _signup,
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('S\'inscrire'),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'Ou connectez-vous avec',
                    style: AppTheme.subtitleStyle,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SocialButton(
                        text: 'Google',
                        iconPath: 'assets/icons/google.png',
                        onPressed: () {
                          // Handle Google signup
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SocialButton(
                        text: 'Facebook',
                        iconPath: 'assets/icons/facebook.png',
                        onPressed: () {
                          // Handle Facebook signup
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
