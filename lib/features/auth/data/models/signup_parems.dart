class SignUpParms {
  final String fistName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String city;
  final String password;

  SignUpParms({
    required this.fistName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.city,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": fistName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobileNumber,
      "city": city,
    };
  }
}
