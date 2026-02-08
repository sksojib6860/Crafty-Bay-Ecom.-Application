import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_color.dart';
import '../../providers/time_providers.dart';

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({super.key});
  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  final TimerProvider _timerProvider = TimerProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _timerProvider,
      child: Consumer<TimerProvider>(
        builder: (context, timerProvider, child) {
          return Column(
            children: [
              if (timerProvider.isRunning)
                Text(
                  'This code will be send ${timerProvider.remainingSeconds}s',
                ),
              TextButton(
                onPressed: () {
                  timerProvider.startTimer(60);
                },
                child: Text(
                  'Resend',
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
}
