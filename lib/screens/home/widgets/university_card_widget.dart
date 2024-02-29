import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/theme/colors.dart';

class UniversityCardWidget extends StatelessWidget {
  final String name;
  final String location;
  final int rate;
  final void Function()? onTap;

  const UniversityCardWidget(
      {super.key,
      required this.name,
      required this.location,
      required this.rate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.darkTurquoise,
              borderRadius:
              BorderRadius.all(Radius.circular(16.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                location,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              RatingBar.builder(
                itemSize: 22,
                initialRating: rate.toDouble(),
                ignoreGestures: true,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    SvgPicture.asset(
                        'assets/images/elements/filled-star.svg'),
                onRatingUpdate: (rating) {},
              ),
            ],
          )),
    );
  }
}
