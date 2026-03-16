import 'package:crafty_bay_app/app/network_caller_setup.dart';
import 'package:crafty_bay_app/app/urls.dart';
import 'package:crafty_bay_app/core/services/network_caller.dart';
import 'package:crafty_bay_app/features/auth/data/models/sign_in_params.dart';
import 'package:flutter/material.dart';

import '../../../../app/controllers/auth_controller.dart';
import '../../data/models/user_model.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get isSignInInProgress => _signInProgress;
  String? successMessage;

  Future<bool> signIn(SignInParms parms) async {
    bool isSuccess = false;
    _signInProgress = true;
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: parms.toJson(),
    );
    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.body['data']['user']);
      String token = response.body['data']['token'];
      await AuthController.saveUserData(token, userModel);
      _errorMessage = null;
      isSuccess = true;
      successMessage = response.body['msg'];
    } else {
      _errorMessage = response.errorMessage;
    }
    _signInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
