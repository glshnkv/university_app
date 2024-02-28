import 'package:flutter/material.dart';
import 'package:university_app/theme/colors.dart';

class OnboardingCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlImage;

  const OnboardingCardWidget(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(urlImage),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.lightTurquoise,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 375,
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}