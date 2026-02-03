import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/providers/language_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    final languageProvider = context.read<LanguageProviders>();
    return Scaffold(
      appBar: AppBar(title: Text(localization.hello)),
      body: Column(
        children: [
          Text(localization.changeYourLanguage),
          DropdownMenu(
            dropdownMenuEntries: languageProvider.supportedLocale.map((e) {
              return DropdownMenuEntry(value: e, label: e.languageCode);
            }).toList(),
            initialSelection: languageProvider.currentLocale,
            onSelected: (value) {
              languageProvider.changeLocale(value!);
            },
          ),
        ],
      ),
    );
  }
}
