import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:university_app/router/router.dart';
import 'package:university_app/screens/onboarding/widgets/onboarding_card_widget.dart';
import 'package:university_app/theme/colors.dart';
import 'package:university_app/widgets/action_button_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTurquoise,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 500,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        isLastPage = index == 1;
                      });
                    },
                    controller: controller,
                    children: [
                      OnboardingCardWidget(
                        urlImage: 'assets/images/onboarding/1.png',
                        title: 'Add relevant educational institutions',
                        subtitle:
                        'Add the universities you are interested in applying to and highlight basic information about them',
                      ),
                      OnboardingCardWidget(
                        urlImage: 'assets/images/onboarding/2.png',
                        title: 'Choose the most suitable university',
                        subtitle:
                        'Study the conditions of all universities and choose the option that suits you best',
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    ActionButtonWidget(
                      text: 'Continue',
                      width: 350,
                      onTap: () {
                        isLastPage ? context.router.push(HomeRoute()) :
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Terms of Use',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '/',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          child: Text(
                            'Privacy policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
