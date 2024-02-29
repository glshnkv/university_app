import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/models/university_model.dart';
import 'package:university_app/router/router.dart';
import 'package:university_app/screens/home/widgets/university_card_widget.dart';
import 'package:university_app/screens/university_bloc/university_bloc.dart';
import 'package:university_app/theme/colors.dart';
import 'package:university_app/widgets/action_button_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Text(
              'Your education',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.router.push(SettingsRoute());
              },
              child: SvgPicture.asset('assets/images/elements/settings.svg'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) =>
                UniversityBloc()..add(GetUniversityListEvent()),
            child: BlocConsumer<UniversityBloc, UniversityState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadedUniversityListState) {
                  if (state.universityList.length != 0) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.universityList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        final UniversityModel _university =
                            state.universityList[index];
                        return UniversityCardWidget(
                            name: _university.name,
                            location: _university.location,
                            rate: _university.rate,
                            onTap: () {
                              context.router.push(UniversityInfoRoute(university: _university));
                            },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'To start the selection, add the first university',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white54),
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add new university', width: 350, onTap: () {
            context.router.push(AddUniversityRoute());
      }),
    );
  }
}
