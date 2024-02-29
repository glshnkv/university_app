import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/models/university_model.dart';
import 'package:university_app/theme/colors.dart';

@RoutePage()
class UniversityInfoScreen extends StatefulWidget {
  final UniversityModel university;

  const UniversityInfoScreen({super.key, required this.university});

  @override
  State<UniversityInfoScreen> createState() => _UniversityInfoScreenState();
}

class _UniversityInfoScreenState extends State<UniversityInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.lightTurquoise),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.lightTurquoise,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'University',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: AppColors.darkTurquoise,
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.university.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.university.location,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    RatingBar.builder(
                      itemSize: 22,
                      initialRating: widget.university.rate.toDouble(),
                      ignoreGestures: true,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => SvgPicture.asset(
                          'assets/images/elements/filled-star.svg'),
                      onRatingUpdate: (rating) {},
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/university-info/image.png',
                        width: 165,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Especialidades',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: widget.university.specialities.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
                itemBuilder: (BuildContext context, int index) {
                  final _speciality = widget.university.specialities[index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.darkTurquoise,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: SvgPicture.asset(
                                  'assets/images/university-info/cap.svg'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _speciality.speciality,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: AppColors.turquoise,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  child: Text(
                                    _speciality.priority,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Tuition fees:',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Text(
                                '${_speciality.tuitionFees.toString()}\$',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              Text(
                'Advantages',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: widget.university.advantages.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 5),
                itemBuilder: (BuildContext context, int index) {
                  final _advantage = widget.university.advantages[index];
                  return ListTile(
                    leading: SvgPicture.asset('assets/images/university-info/adv.svg'),
                    title: Text(
                      _advantage,
                      style: TextStyle(
                        color: AppColors.lightTurquoise,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
              Text(
                'Disadvantages',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: widget.university.disadvantages.length,
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 5),
                itemBuilder: (BuildContext context, int index) {
                  final _disadvantage = widget.university.disadvantages[index];
                  return ListTile(
                    leading: SvgPicture.asset('assets/images/university-info/disadv.svg'),
                    title: Text(
                      _disadvantage,
                      style: TextStyle(
                        color: AppColors.lightTurquoise,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
