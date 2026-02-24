import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../widget/utils/app_logo.dart';
import '../widget/utils/validator.dart';
import 'login_screen.dart';
import 'otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String name = '/sign_up';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
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
                    localization.completeProfile,
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    localization.getStarted_your_details,
                    style: context.textTheme.bodySmall,
                  ),
                  TextFormField(
                    controller: _firstnameTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: localization.firstName,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourFirstName,
                    ),
                  ),
                  TextFormField(
                    controller: _lastnameTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: localization.lastName,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourLastName,
                    ),
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: localization.email,
                    ),
                    validator: (String? value) =>
                        Validators.validateEmail(context, value),
                  ),
                  TextFormField(
                    controller: _phoneTEController,
                    decoration: InputDecoration(
                      hintText: localization.phoneNumber,
                      hintStyle: context.textTheme.bodyMedium,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourPhoneNumber,
                    ),
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: _addressTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: localization.address,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourAddress,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: localization.password,
                    ),
                    validator: (value) =>
                        Validators.validatePassword(context, value),
                  ),
                  FilledButton(
                    onPressed: () {
                      _signupButton();
                    },
                    child: Text(localization.signUp),
                  ),
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

  void _signupButton() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamedAndRemoveUntil(
        context,
        OtpVerificationScreen.name,
        (route) => false,
      );
    }
  }

  void _signIn() {
    Navigator.pushNamed(context, LoginScreen.name);
  }

  @override
  void dispose() {
    _firstnameTEController.dispose();
    _lastnameTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
