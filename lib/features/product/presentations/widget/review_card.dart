import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class ReviewCardIteam extends StatefulWidget {
  const ReviewCardIteam({super.key});

  @override
  State<ReviewCardIteam> createState() => _ReviewCardIteamState();
}

class _ReviewCardIteamState extends State<ReviewCardIteam> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shadowColor: AppColor.themeColor.withAlpha(30),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 6,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withAlpha(40),
                  child: Icon(Icons.account_circle, color: Colors.grey),
                ),
                Text('User Name'),
              ],
            ),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites',
            ),
          ],
        ),
      ),
    );
  }
}
