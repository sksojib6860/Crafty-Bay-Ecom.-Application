import 'package:crafty_bay_app/app/network_caller_setup.dart';
import 'package:crafty_bay_app/app/urls.dart';
import 'package:crafty_bay_app/core/services/network_caller.dart';
import 'package:crafty_bay_app/features/auth/data/models/signup_parems.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  bool signUpInProgress = false;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParms parms) async {
    bool isSuccess = false;
    signUpInProgress = true;
    notifyListeners();

    final NetworkResponse response = (await getNetworkCaller().postRequest(
      Urls.signUpUrl,
      body: parms.toJson(),
    ));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    signUpInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
