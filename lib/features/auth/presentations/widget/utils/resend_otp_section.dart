import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/features/auth/data/models/resend_otp_parms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_color.dart';
import '../../../../shared/presentation/widget/snackbar_message.dart';
import '../../providers/resent_otp_provider.dart';
import '../../providers/time_providers.dart';

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({super.key, required this.email});
  final String? email;

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  final TimerProvider _timerProvider = TimerProvider();
  final ResendOtpProvider _resendOtpProvider = ResendOtpProvider();

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return ChangeNotifierProvider.value(
      value: _timerProvider,
      child: Consumer<TimerProvider>(
        builder: (context, timerProvider, child) {
          return Column(
            children: [
              if (timerProvider.isRunning)
                Text(
                  localization.thisCodeWillBeSend +
                      timerProvider.remainingSeconds.toString() +
                      localization.s,
                ),
              TextButton(
                onPressed: () {
                  timerProvider.startTimer(60);
                  resendOTP();
                },
                child: Text(
                  localization.resendOtp,
                  style: TextStyle(
                    color: timerProvider.isRunning
                        ? Colors.grey
                        : AppColor.themeColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> resendOTP() async {
    ResendOtpParms parms = ResendOtpParms(email: widget.email!);

    final bool isSuccess = await _resendOtpProvider.resentOtp(parms);
    if (isSuccess) {
      showSnackBarMassage(context, _resendOtpProvider.successMessage!);
    } else {
      showSnackBarMassage(context, _resendOtpProvider.errorMessage!);
    }
  }
}
