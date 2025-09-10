import 'package:evently/widget/event_item.dart';
import 'package:evently/widget/text_faild_item.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            TextFaildItem(hintText: 'Search', keyboardType: TextInputType.name),
            SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) => EventItem(),
                separatorBuilder: (_, __) => SizedBox(height: 16),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
