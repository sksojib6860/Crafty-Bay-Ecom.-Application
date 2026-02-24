import 'package:crafty_bay_app/app/app_color.dart';
import 'package:flutter/material.dart';

import '../widget/review_botton_bar.dart';
import '../widget/review_card.dart';
import 'create_review_screen.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});
  static const String name = '/review_screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reviews")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) {
                return ReviewCardIteam();
              },
            ),
          ),
          ReviewBottomBar(toTapCart: () {}),
          SizedBox(height: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColor.themeColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CreateReviewScreen.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
