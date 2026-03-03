class VerifyOtpParms {
  final String email;
  final String otp;

  VerifyOtpParms({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {"email": email, "otp": otp};
  }
}
