import 'package:evently/app_theme.dart';
import 'package:evently/tabs/profile_tab/profile_header.dart';
import 'package:flutter/material.dart';

class profileTab extends StatelessWidget {
  List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'العربية'),
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeader(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
              ),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButton(
                  value: 'en',
                  items: languages
                      .map(
                        (language) => DropdownMenuItem(
                          value: language.code,
                          child: Text(
                            language.name,
                            style: textTheme.titleLarge,
                          ),
                        ),
                      )
                      .toList(),
                  borderRadius: BorderRadius.circular(16),
                  underline: SizedBox(),
                  iconEnabledColor: AppTheme.primaryColor,
                  isExpanded: true,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme',
                    style: textTheme.titleLarge!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeTrackColor: AppTheme.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Language {
  String name;
  String code;

  Language({required this.code, required this.name});
}
