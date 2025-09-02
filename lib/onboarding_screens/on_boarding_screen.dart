import 'package:evently/app_theme.dart';
import 'package:evently/onboarding_screens/dot_indicator.dart';
import 'package:evently/onboarding_screens/onboaring_screens_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/welcome';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  List<OnboaringScreensItem> onboardingScreensI = [
    OnboaringScreensItem(
      image: 'assets/images/onboarding_2.png',
      title: 'Find Events That Inspire You',
      subTitle:
          'Dive into a world of events crafted to fit your unique interests. Whether you`re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnboaringScreensItem(
      image: 'assets/images/onboarding_3.png',
      title: 'Effortless Event Planning',
      subTitle:
          'Take the hassle out of organizing events withour all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    ),
    OnboaringScreensItem(
      image: 'assets/images/onboarding_4.png',
      title: 'Connect with Friends & Share Moments',
      subTitle:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    ),
  ];

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.toInt() ?? 0;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: BoxDecoration(color: AppTheme.backgroundColorLight),

        child: Column(
          children: [
            Image.asset(
              'assets/images/header_icon.png',
              height: screenHeight * 0.1,
              fit: BoxFit.fill,
            ),
            SizedBox(height: screenHeight * 0.1),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingScreensI.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onboardingScreensI[index].image,
                        height: screenHeight * 0.4,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            onboardingScreensI[index].title,
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(color: AppTheme.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.06),
                          Text(
                            onboardingScreensI[index].subTitle,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: AppTheme.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset('assets/icons/backk.svg'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingScreensI.length,
                              (dotIndex) => DotIndicator(
                                active: currentIndex == dotIndex,
                              ),
                            ),
                          ),
                          IconButton(
                            // Use SvgPicture.asset for SVGs
                            icon: SvgPicture.asset('assets/icons/next.svg'),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('seenOnboarding', true);
                              if (currentIndex <
                                  onboardingScreensI.length - 1) {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              } else {
                                // Navigate to the main app screen or another screen
                                Navigator.pushNamed(context, '/home');
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  //Future<void> closeOnboarding() async {
  //final prefs = await SharedPreferences.getInstance();
  // await prefs.setBool('completed', false);
  //}

