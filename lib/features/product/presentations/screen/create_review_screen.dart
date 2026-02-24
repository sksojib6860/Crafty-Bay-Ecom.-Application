import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentations/widget/utils/validator.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
  static const String name = '/create_review_screen';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _reviewTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Review')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 50),
                  TextFormField(
                    controller: _firstnameTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: 'First Name',
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, 'Enter Your First Name'),
                  ),
                  TextFormField(
                    controller: _lastnameTEController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, 'Enter Your Last Name'),
                  ),
                  TextFormField(
                    maxLines: 6,
                    controller: _reviewTeController,
                    decoration: InputDecoration(
                      hintStyle: context.textTheme.bodyMedium,
                      hintText: 'Write Review',
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, 'Enter Your Reviews'),
                  ),
                  FilledButton(
                    onPressed: () {
                      _submitButton();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitButton() {}
}
