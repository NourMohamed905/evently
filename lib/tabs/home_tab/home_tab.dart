import 'package:evently/tabs/home_tab/home_header.dart';
import 'package:evently/widget/event_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(),
        SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(),
            separatorBuilder: (_, __) => SizedBox(height: 16),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
