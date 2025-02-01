import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/features/auth/presentation/pages/reset_password_page.dart';

class VerifyOTPPage extends StatefulWidget {
  final String email;

  const VerifyOTPPage({
    super.key,
    required this.email,
  });

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  int _timeLeft = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
        _startTimer();
      }
    });
  }

  String get _formattedTime {
    int minutes = _timeLeft ~/ 60;
    int seconds = _timeLeft % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vérification des e-mails',
                style: AppTheme.headingStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Entrez le code de vérification envoyé à ${widget.email}',
                style: AppTheme.subtitleStyle,
              ),
              const SizedBox(height: 32),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: _otpController,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 56,
                  fieldWidth: 56,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: AppTheme.primaryColor,
                  selectedColor: AppTheme.primaryColor,
                  inactiveColor: AppTheme.inputBorderColor,
                ),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _timeLeft > 0 ? _formattedTime : 'Le code a expiré',
                    style: AppTheme.subtitleStyle,
                  ),
                  TextButton(
                    onPressed: _timeLeft == 0
                        ? () {
                            setState(() {
                              _timeLeft = 60;
                            });
                            _startTimer();
                          }
                        : null,
                    child: Text(
                      'Renvoyer',
                      style: TextStyle(
                        color: _timeLeft == 0
                            ? AppTheme.primaryColor
                            : AppTheme.mutedTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_otpController.text.length == 4) {
                    Get.to(() => const ResetPasswordPage());
                  }
                },
                child: const Text('Continuer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}