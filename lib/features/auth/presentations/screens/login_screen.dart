import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/screen/top_nav_bar_controller.dart';
import '../../../shared/presentation/widget/snackbar_message.dart';
import '../../data/models/sign_in_params.dart';
import '../providers/sign_in_provider.dart';
import '../widget/utils/app_logo.dart';
import '../widget/utils/validator.dart';

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
  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return ChangeNotifierProvider.value(
      value: _signInProvider,
      child: Scaffold(
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
                    Text(
                      'Welcome Back',
                      style: context.textTheme.headlineLarge,
                    ),
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
                    Consumer<SignInProvider>(
                      builder: (context, signInProvider, child) {
                        if (signInProvider.isSignInInProgress) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: () {
                            _loginButton();
                          },
                          child: Text('Log In'),
                        );
                      },
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
      ),
    );
  }

  void _loginButton() {
    if (_formKey.currentState!.validate()) {
      signIn();
    }
  }

  Future<void> signIn() async {
    SignInParms parms = SignInParms(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signInProvider.signIn(parms);
    if (isSuccess) {
      showSnackBarMassage(context, _signInProvider.successMessage!);
      Navigator.pushNamedAndRemoveUntil(
        context,
        TopNavBarController.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMassage(context, _signInProvider.errorMessage!);
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
