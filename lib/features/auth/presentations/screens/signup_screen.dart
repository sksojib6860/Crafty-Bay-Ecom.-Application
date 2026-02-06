import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/app_logo.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/validator.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SafeArea(
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
                  'Complete Profile',
                  style: context.textTheme.headlineLarge,
                ),
                Text(
                  'Get Started with us with your details',
                  style: context.textTheme.bodySmall,
                ),
                TextFormField(
                  controller: _firstnameTEController,
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (String? value) =>
                      Validators.validateText(value, 'Enter your First Name'),
                ),
                TextFormField(
                  controller: _lastnameTEController,
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) =>
                      Validators.validateText(value, 'Enter your Last Name'),
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (String? value) => Validators.validateEmail(value),
                ),
                TextFormField(
                  controller: _phoneTEController,
                  decoration: InputDecoration(hintText: 'Phone Number'),
                  validator: (String? value) =>
                      Validators.validateText(value, 'Enter your phone number'),
                ),
                TextFormField(
                  controller: _addressTEController,
                  decoration: InputDecoration(hintText: 'Address'),
                  validator: (String? value) =>
                      Validators.validateText(value, 'Enter your address'),
                ),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: Validators.validatePassword,
                ),
                FilledButton(
                  onPressed: () {
                    _signupButton();
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signupButton() {}
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
