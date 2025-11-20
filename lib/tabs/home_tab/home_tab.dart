import 'package:evently/providers/event_provider.dart';
import 'package:evently/tabs/home_tab/home_header.dart';
import 'package:evently/widget/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    EventProvider events = Provider.of<EventProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(),
        SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(events.displayedEvents[index]),
            separatorBuilder: (_, __) => SizedBox(height: 16),
            itemCount: events.displayedEvents.length,
          ),
        ),
      ],
    );
  }
}
