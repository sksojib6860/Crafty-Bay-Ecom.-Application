class ResendOtpParms {
  final String email;

  ResendOtpParms({required this.email});

  Map<String, dynamic> toJson() {
    return {"email": email};
  }
}
