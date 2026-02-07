// import 'package:crafty_bay_app/app/extensions/language_extension.dart';
// import 'package:flutter/cupertino.dart';
//
// class Validators {
//   static String? validateText(String? value, String message) {
//     if (value == null || value.isEmpty) {
//       return message;
//     }
//     return null;
//   }
//
//   static String? validateEmail(BuildContext context, String? value) {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (value == null || value.isEmpty) {
//       return context.l10n.enterYourEmail;
//     } else if (!emailRegex.hasMatch(value)) {
//       return context.l10n.enterValidEmail;
//     }
//     return null;
//   }
//
//   static String? validatePassword(BuildContext context, String? value) {
//     if (value == null || value.isEmpty) {
//       return context.l10n.enterYourPassword;
//     } else if (value.length < 6) {
//       return context.l10n.enterValidPassword;
//     }
//     return null;
//   }
// }

import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:flutter/cupertino.dart';

class Validators {
  static String? validateText(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return _tryL10n(
        context,
        (l) => (l as dynamic).enterYourEmail,
        "Email address can't be empty",
      );
    } else if (!emailRegex.hasMatch(value)) {
      return _tryL10n(
        context,
        (l) => (l as dynamic).enterValidEmail,
        'Enter a valid email address',
      );
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return _tryL10n(
        context,
        (l) => (l as dynamic).enterYourPassword,
        'Password is required',
      );
    } else if (value.length < 6) {
      return _tryL10n(
        context,
        (l) => (l as dynamic).enterValidPassword,
        'Enter a valid password',
      );
    }
    return null;
  }

  static String _tryL10n(
    BuildContext context,
    String Function(dynamic) getter,
    String fallback,
  ) {
    try {
      final msg = getter(context.l10n);
      if (msg.isNotEmpty) return msg;
    } catch (_) {}
    return fallback;
  }
}
