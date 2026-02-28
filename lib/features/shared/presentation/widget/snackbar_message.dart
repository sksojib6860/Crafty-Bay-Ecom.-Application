import 'package:flutter/material.dart';

void showSnackBarMassage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
