import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/models/speciality_model.dart';
import 'package:university_app/models/university_model.dart';
import 'package:university_app/router/router.dart';
import 'package:university_app/screens/university_bloc/university_bloc.dart';
import 'package:university_app/theme/colors.dart';
import 'package:university_app/widgets/action_button_widget.dart';
import 'package:university_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddUniversityScreen extends StatefulWidget {
  const AddUniversityScreen({super.key});

  @override
  State<AddUniversityScreen> createState() => _AddUniversityScreenState();
}

class _AddUniversityScreenState extends State<AddUniversityScreen> {
  final pageController = PageController();
  bool isLastPage = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController advantageController = TextEditingController();
  final TextEditingController disadvantageController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController tuitionFeesController = TextEditingController();

  double rate = 0;
  List<String> advantages = [];
  List<String> disadvantages = [];
  List<SpecialityModel> specialities = [];

  List<String> priorityList = ['First', 'Second', 'Third'];
  String priority = 'First';
  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    advantageController.dispose();
    disadvantageController.dispose();
    specializationController.dispose();
    tuitionFeesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        title: GestureDetector(
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
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'New University',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                controller: pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldAppWidget(
                            controller: nameController,
                            hintText: 'Name of the University'),
                        SizedBox(height: 10),
                        TextFieldAppWidget(
                            controller: locationController,
                            hintText: 'Location of the University'),
                        SizedBox(height: 10),
                        TextFieldAppWidget(
                            controller: descriptionController,
                            hintText: 'Description of the University'),
                        SizedBox(height: 15),
                        Text(
                          'Rating of University reviews',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        RatingBar.builder(
                          itemSize: 35,
                          initialRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => SvgPicture.asset(
                              'assets/images/elements/filled-star.svg'),
                          onRatingUpdate: (rating) {
                            rate = rating;
                          },
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Advantages',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (advantageController.text.isNotEmpty) {
                                      advantages.add(advantageController.text);
                                      advantageController.clear();
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/images/elements/add.svg'),
                              )
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            itemCount: advantages.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 15),
                            itemBuilder: (BuildContext context, int index) {
                              final _advantage = advantages[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.lightTurquoise,
                                        width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/university-info/adv.svg'),
                                    SizedBox(width: 10),
                                    Text(
                                      _advantage,
                                      style: TextStyle(
                                        color: AppColors.lightTurquoise,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          TextFieldAppWidget(
                              controller: advantageController,
                              hintText: 'Name of the advantage'),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Disadvantages',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (disadvantageController
                                        .text.isNotEmpty) {
                                      disadvantages
                                          .add(disadvantageController.text);
                                      disadvantageController.clear();
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/images/elements/add.svg'),
                              )
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            itemCount: disadvantages.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 15),
                            itemBuilder: (BuildContext context, int index) {
                              final _disadvantage = disadvantages[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.lightTurquoise,
                                        width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/university-info/disadv.svg'),
                                    SizedBox(width: 10),
                                    Text(
                                      _disadvantage,
                                      style: TextStyle(
                                        color: AppColors.lightTurquoise,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          TextFieldAppWidget(
                              controller: disadvantageController,
                              hintText: 'Name of the disadvantage'),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'List of specialties',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (specializationController
                                            .text.isNotEmpty &&
                                        tuitionFeesController.text.isNotEmpty) {
                                      specialities.add(SpecialityModel(
                                          speciality:
                                              specializationController.text,
                                          priority: priority,
                                          tuitionFees: int.parse(
                                              tuitionFeesController.text)));
                                      specializationController.clear();
                                      tuitionFeesController.clear();
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/images/elements/add.svg'),
                              ),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            itemCount: specialities.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 15),
                            itemBuilder: (BuildContext context, int index) {
                              final _speciality = specialities[index];
                              return Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: AppColors.darkTurquoise,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0))),
                                          child: SvgPicture.asset(
                                              'assets/images/university-info/cap.svg'),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              decoration: BoxDecoration(
                                                  color: AppColors.turquoise,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0))),
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
                          TextFieldAppWidget(
                              controller: specializationController,
                              hintText: 'Name of the specialization'),
                          SizedBox(height: 15),
                          Text(
                            'Priority',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          ChipList(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            spacing: 10,
                            listOfChipNames: priorityList,
                            activeBorderColorList: [AppColors.lightTurquoise],
                            inactiveBorderColorList: [AppColors.darkTurquoise],
                            activeBgColorList: [AppColors.black],
                            inactiveBgColorList: [AppColors.black],
                            activeTextColorList: [AppColors.lightTurquoise],
                            inactiveTextColorList: [AppColors.darkTurquoise],
                            listOfChipIndicesCurrentlySeclected: [
                              _currentIndex
                            ],
                            shouldWrap: true,
                            checkmarkColor: AppColors.lightTurquoise,
                            extraOnToggle: (val) {
                              _currentIndex = val;
                              setState(() {
                                priority = priorityList[_currentIndex];
                              });
                            },
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Priority',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFieldAppWidget(
                              controller: tuitionFeesController,
                              hintText: 'Price of the Tuition Fee'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: isLastPage ? 'Save' : 'Next',
          width: 350,
          onTap: () {
            if (isLastPage) {
              if (nameController.text.isNotEmpty &&
                  locationController.text.isNotEmpty &&
                  specialities.isNotEmpty) {
                context.read<UniversityBloc>().add(AddUniversityEvent(
                        university: UniversityModel(
                      name: nameController.text,
                      location: locationController.text,
                      rate: rate.toInt(),
                      advantages: advantages,
                      disadvantages: disadvantages,
                      specialities: specialities,
                      description: descriptionController.text,
                    )));
                context.router.push(HomeRoute());
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.darkTurquoise,
                    content: Text(
                      'Please, Fill out the remaining fields',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                );
              }
            } else {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          }),
    );
  }
}
