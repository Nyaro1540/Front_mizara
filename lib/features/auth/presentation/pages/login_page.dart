import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:mizara/features/auth/presentation/pages/signup_page.dart';
import 'package:mizara/features/home/screens/home_page.dart';
import 'package:mizara/shared/widgets/custom_text_field.dart';
import 'package:mizara/shared/widgets/social_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
=======
import 'package:http/http.dart' as http;
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/shared/widgets/custom_text_field.dart';
>>>>>>> 43e9562508fb59cc3a4dcbb2a176da0ac2b253c9

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login() async {
<<<<<<< HEAD
    final emailOrPhone = _emailOrPhoneController.text;
    final password = _passwordController.text;

    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/login/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email_or_phone': emailOrPhone, 'password': password}),
    );

    if (response.statusCode == 200) {
      Get.off(() => const HomeScreen());
    } else {
      final error = json.decode(response.body)['error'];
      Get.snackbar('Erreur', error, snackPosition: SnackPosition.BOTTOM);
=======
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
>>>>>>> 43e9562508fb59cc3a4dcbb2a176da0ac2b253c9
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
                  'Se connecter',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 8),
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
                ElevatedButton(
<<<<<<< HEAD
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: const Text('Se connecter'),
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
                        iconPath: 'assets/icons/Ellipse google.svg',
                        onPressed: () {
                          _handleGoogleSignIn();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SocialButton(
                        text: 'Facebook',
                        iconPath: 'assets/icons/icons8-facebook-nouveau 1.svg',
                        onPressed: () {
                          _handleFacebookSignIn();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () => Get.to(() => const SignupPage()),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Vous n\'avez pas de compte ? ',
                        style: AppTheme.subtitleStyle,
                        children: [
                          TextSpan(
                            text: 'Créer un compte',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
=======
                  onPressed: _login,
                  child: const Text('Se connecter'),
                ),
>>>>>>> 43e9562508fb59cc3a4dcbb2a176da0ac2b253c9
              ],
            ),
          ),
        ),
      ),
    );
  }
}
