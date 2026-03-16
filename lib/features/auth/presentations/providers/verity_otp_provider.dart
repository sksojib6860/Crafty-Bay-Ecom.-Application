import 'package:crafty_bay_app/app/controllers/auth_controller.dart';
import 'package:crafty_bay_app/features/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_setup.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/verify_otp_parms.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool _isVerifyOtpInProgress = false;
  bool get isVerifyOtpInProgress => _isVerifyOtpInProgress;
  String? _errorMessage;
  String? successMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpParms parms) async {
    bool isSuccess = false;
    _isVerifyOtpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.verifyOtpUrl,
      body: parms.toJson(),
    );
    if (response.isSuccess) {
      /// saved user data and token

      UserModel userModel = UserModel.fromJson(response.body['data']['user']);
      String token = response.body['data']['token'];
      await AuthController.saveUserData(token, userModel);
      isSuccess = true;
      _errorMessage = null;
      successMessage = response.body['msg'];
    } else {
      _errorMessage = response.errorMessage;
    }
    _isVerifyOtpInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
