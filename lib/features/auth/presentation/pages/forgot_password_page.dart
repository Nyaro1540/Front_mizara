import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/features/auth/presentation/pages/verify_otp_page.dart';
import 'package:mizara/shared/widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    final email = _emailController.text;
    final url = Uri.parse('http://localhost:8000/password-reset-request/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      Get.to(() => VerifyOTPPage(email: email));
    } else {
      final error = json.decode(response.body)['error'];
      Get.snackbar('Erreur', error, snackPosition: SnackPosition.BOTTOM);
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
                  'Mot de passe oublié',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Entrez votre adresse e-mail et nous vous enverrons un code de confirmation pour réinitialiser votre mot de passe',
                  style: AppTheme.subtitleStyle,
                ),
                const SizedBox(height: 32),
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
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _resetPassword();
                    }
                  },
                  child: const Text('Continuer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}