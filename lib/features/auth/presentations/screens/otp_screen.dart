import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/shared/presentation/screen/top_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_color.dart';
import '../../../shared/presentation/widget/snackbar_message.dart';
import '../../data/models/verify_otp_parms.dart';
import '../providers/verity_otp_provider.dart';
import '../widget/utils/app_logo.dart';
import '../widget/utils/resend_otp_section.dart';
import 'login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;
  static const String name = '/otp_verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return ChangeNotifierProvider.value(
      value: _verifyOtpProvider,
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
                    const SizedBox(height: 10),
                    AppLogo(),
                    Text(
                      localization.enterOtpCode,
                      style: context.textTheme.headlineLarge,
                    ),
                    Text(
                      localization.a4digitOtpCodeHasBeenSent,
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
                    Consumer<VerifyOtpProvider>(
                      builder: (context, verifyOtpProvider, child) {
                        if (verifyOtpProvider.isVerifyOtpInProgress) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: () {
                            _verifyOtpButton();
                          },
                          child: Text(localization.verifyOtp),
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    ResendOtpSection(email: widget.email),
                    TextButton(
                      onPressed: () {
                        _signIn();
                      },
                      child: Text(localization.alreadyHaveAccount),
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

  void _verifyOtpButton() {
    if (_formKey.currentState!.validate()) {
      verifyOtp();
    }
  }

  Future<void> verifyOtp() async {
    VerifyOtpParms parms = VerifyOtpParms(
      email: widget.email,
      otp: _otpController.text.trim(),
    );

    final bool isSuccess = await _verifyOtpProvider.verifyOtp(parms);
    if (isSuccess) {
      showSnackBarMassage(context, _verifyOtpProvider.successMessage!);
      Navigator.pushNamedAndRemoveUntil(
        context,
        TopNavBarController.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMassage(context, _verifyOtpProvider.errorMessage!);
    }
  }

  void _signIn() {
    Navigator.pushNamed(context, LoginScreen.name);
  }
}
