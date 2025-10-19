import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  EventItem(this.event);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/${event.category.imageName}.png',
            width: double.infinity,
            height: size.height * 0.24,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.white,
          ),
          child: Column(
            children: [
              Text('${event.dateTime.day}', style: textTheme.titleLarge),
              Text(
                DateFormat('MMM').format(event.dateTime),
                style: textTheme.titleSmall!.copyWith(
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          width: size.width - 32,
          bottom: 8,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: textTheme.titleSmall!.copyWith(
                      color: AppTheme.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
