import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/screens/signup_screen.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/app_logo.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                  const SizedBox(height: 40),
                  AppLogo(),
                  Text('Welcome Back', style: context.textTheme.headlineLarge),
                  Text(
                    'Please enter your user name and password',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: 'Email Address',
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourEmail,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: 'Password',
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourPassword,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      _loginButton();
                    },
                    child: Text('Log In'),
                  ),

                  TextButton(
                    onPressed: () {
                      _signUpScreen();
                    },
                    child: Text('Don\'t have an account? Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginButton() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void _signUpScreen() {
    Navigator.pushNamed(context, SignupScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
