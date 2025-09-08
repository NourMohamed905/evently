import 'package:evently/app_theme.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/tabs/home_tab/tab_bar_item.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 8),
            Text(
              'John Safwat',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            DefaultTabController(
              length: CategoryModel.categories.length + 1,
              child: TabBar(
                padding: EdgeInsets.only(left: 0),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.only(right: 10),
                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  setState(() {});
                },
                tabs: [
                  TabBarItem(
                    label: 'All',
                    icon: Icons.all_out_outlined,
                    isSelected: currentIndex == 0,
                    selectedBackgroundColor: AppTheme.white,
                    selectedForegroundColor: AppTheme.primaryColor,
                    unSelectedForegroundColor: AppTheme.white,
                  ),
                  ...CategoryModel.categories.map(
                    (category) => TabBarItem(
                      label: category.name,
                      icon: category.icon,
                      isSelected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(category) + 1,
                      selectedBackgroundColor: AppTheme.white,
                      selectedForegroundColor: AppTheme.primaryColor,
                      unSelectedForegroundColor: AppTheme.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
