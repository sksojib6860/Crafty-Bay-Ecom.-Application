import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/app_logo.dart';
import 'package:crafty_bay_app/features/auth/presentations/widget/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/providers/language_providers.dart';

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
    final languageProvider = context.read<LanguageProviders>();
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
                    localization.getStarted_your_details,
                    style: context.textTheme.bodySmall,
                  ),
                  TextFormField(
                    controller: _firstnameTEController,
                    decoration: InputDecoration(
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
                      hintText: localization.lastName,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourLastName,
                    ),
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: localization.email),
                    validator: (String? value) =>
                        Validators.validateEmail(context, value),
                  ),
                  TextFormField(
                    controller: _phoneTEController,
                    decoration: InputDecoration(
                      hintText: localization.phoneNumber,
                    ),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourPhoneNumber,
                    ),
                  ),
                  TextFormField(
                    controller: _addressTEController,
                    decoration: InputDecoration(hintText: localization.address),
                    validator: (String? value) => Validators.validateText(
                      value,
                      localization.enterYourAddress,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(
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
                  DropdownMenu(
                    dropdownMenuEntries: languageProvider.supportedLocale.map((
                      e,
                    ) {
                      return DropdownMenuEntry(value: e, label: e.languageCode);
                    }).toList(),
                    initialSelection: languageProvider.currentLocale,
                    onSelected: (value) {
                      languageProvider.changeLocale(value!);
                    },
                  ),
                ],
              ),
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
