import 'package:crafty_bay_app/app/app_color.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widget/utils/resend_otp_section.dart';
import 'login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp_verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final localization = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: 10,
                children: [
                  const SizedBox(height: 10),
                  AppLogo(),
                  Text(
                    "Enter OTP Code",
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    "A 4 digit otp code has been sent",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall,
                  ),
                  PinCodeTextField(
                    controller: _otpController,
                    appContext: context,
                    length: 6,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      selectedColor: AppColor.themeColor,
                      activeColor: AppColor.themeColor,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      _verifyOtpButton();
                    },
                    child: Text('Verify OTP'),
                  ),
                  const SizedBox(height: 5),
                  ResendOtpSection(),
                  TextButton(
                    onPressed: () {
                      _signIn();
                    },
                    child: Text('Already have an account? Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _verifyOtpButton() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }

  void _signIn() {
    Navigator.pushNamed(context, LoginScreen.name);
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
