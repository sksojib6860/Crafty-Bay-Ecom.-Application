class SignInParms {
  final String email;
  final String password;

  SignInParms({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
