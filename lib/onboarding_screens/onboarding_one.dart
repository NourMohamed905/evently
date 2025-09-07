import 'package:evently/app_theme.dart';
import 'package:evently/onboarding_screens/on_boarding_screen.dart';
import 'package:evently/onboarding_screens/onboaring_screens_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingOne extends StatefulWidget {
  static const String routeName = '/onboarding_one';

  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    OnboaringScreensItem child = OnboaringScreensItem(
      image: 'assets/images/onboarding_1.png',
      title: 'Personalize Your Experience',
      subTitle:
          'Choose your preferred theme and language to\nget started with a comfortable, tailored\nexperience that suits your style.',
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header_icon.png',
              height: screenHeight * 0.1,
              fit: BoxFit.fill,
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      child.image,
                      height: screenHeight * 0.4,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      child.title,
                      style: AppTheme.lightTheme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      child.subTitle,
                      //textAlign: TextAlign.center,
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Language',
                              style: AppTheme.lightTheme.textTheme.bodyLarge!
                                  .copyWith(color: AppTheme.primaryColor),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppTheme.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      'assets/images/eg.png',
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    child: Image.asset(
                                      'assets/images/en.png',
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Row(
                          children: [
                            Text(
                              'Theme',
                              style: AppTheme.lightTheme.textTheme.bodyLarge!
                                  .copyWith(color: AppTheme.primaryColor),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppTheme.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Sun.svg',
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.fill,
                                    color: AppTheme.primaryColor,
                                  ),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/icons/Moon.svg',
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          OnBoardingScreen.routeName,
                        );
                        setState(() {});
                      },
                      child: Text(
                        'Let’s Start',
                        style: AppTheme.lightTheme.textTheme.bodyMedium!
                            .copyWith(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
