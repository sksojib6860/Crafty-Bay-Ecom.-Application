import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_setup.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/resend_otp_parms.dart';

class ResendOtpProvider extends ChangeNotifier {
  bool resendOtpProgress = false;
  String? _errorMessage;
  String? successMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> resentOtp(ResendOtpParms parms) async {
    bool isSuccess = false;
    resendOtpProgress = true;
    notifyListeners();

    final NetworkResponse response = (await getNetworkCaller().postRequest(
      Urls.resendOtpUrl,
      body: parms.toJson(),
    ));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      successMessage = response.body['msg'];
    } else if (response.responseCode == 400) {
      _errorMessage = response.errorMessage;
    } else {
      _errorMessage = response.errorMessage;
    }

    resendOtpProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
