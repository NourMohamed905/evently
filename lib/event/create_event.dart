import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/tabs/home_tab/tab_bar_item.dart';
import 'package:evently/widget/button_item.dart';
import 'package:evently/widget/text_button_item.dart';
import 'package:evently/widget/text_faild_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = '/createEvent';

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventDiscription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.asset(
                  'assets/images/sport.png',
                  height: size.height * 0.28,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            DefaultTabController(
              length: CategoryModel.categories.length,
              child: TabBar(
                padding: EdgeInsets.only(left: 16),
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
                tabs: CategoryModel.categories
                    .map(
                      (category) => TabBarItem(
                        label: category.name,
                        icon: category.icon,
                        isSelected:
                            currentIndex ==
                            CategoryModel.categories.indexOf(category) + 1,
                        selectedBackgroundColor: AppTheme.primaryColor,
                        selectedForegroundColor: AppTheme.white,
                        unSelectedForegroundColor: AppTheme.primaryColor,
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: textTheme.bodyMedium),
                    SizedBox(height: size.height * 0.01),
                    TextFaildItem(
                      hintText: 'Event Title',
                      keyboardType: TextInputType.name,
                      prefixIcon: 'eventTitle',
                      controller: eventTitle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Title must be not empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text('Description', style: textTheme.bodyMedium),
                    SizedBox(height: size.height * 0.01),
                    TextFaildItem(
                      hintText: 'Event Description',
                      keyboardType: TextInputType.name,
                      controller: eventDiscription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Discription must be not empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/date.svg'),
                        SizedBox(width: 10),
                        Text('Event Date', style: textTheme.bodyMedium),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            );
                          },
                          child: Text(
                            'Choose Date',
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/time.svg'),
                        SizedBox(width: 10),
                        Text('Event Time', style: textTheme.bodyMedium),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                          child: Text(
                            'Choose Time',
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text('Location', style: textTheme.bodyMedium),
                    SizedBox(height: size.height * 0.01),

                    TextFaildItem(
                      hintText: 'Event Title',
                      keyboardType: TextInputType.name,
                      prefixIcon: 'location',
                    ),
                    SizedBox(height: size.height * 0.03),
                    ButtonItem(onPressed: CreateEvent, text: 'Add Event'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void CreateEvent() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
  }
}
