import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_academy/UI/widgets/courses_widget.dart';
import 'package:medical_academy/bussiness_logic/auth/delete_token_cubit.dart';
import 'package:medical_academy/bussiness_logic/courses/courses_cubit.dart';
import 'package:medical_academy/constant/strings.dart';
import 'package:medical_academy/data/models/all_courses_model.dart';

import '../../constant/colors.dart';
import '../../constant/global_variables.dart';
import '../widgets/loading_indecator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
    BlocProvider.of<CoursesCubit>(context).getAllCourses();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  AllCoursesModel? allCoursesModel;

  List<Course> courses = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CoursesLoading) {
          showLoadingIndicator();
        }
        if (state is CoursesLoaded) {
          allCoursesModel = state.allCoursesModel;
          courses = state.allCoursesModel.courses!;
          return SafeArea(
            child: Scaffold(
              body: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'HOME',
                            style: GoogleFonts.pacifico(
                                color: blue, fontSize: 25),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.logout,
                              color: blue,
                            ),
                            onPressed: () async {
                              await BlocProvider.of<DeleteTokenCubit>(context).deleteProduct();
                              prefs.setBool("ISLOGGED", false);
                              Navigator.pushReplacementNamed(context, auth);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.75,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => coursesWidget(
                                context,
                                courses[index].name.toString(),
                                courses[index].description.toString(),
                                courses[index].sessionsCount.toString(),
                                courses[index].instructorName.toString(),
                                courses[index].imagePath.toString(),
                                courses[index].id!,
                                courses[index].price.toString(),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 15,
                                ),
                            itemCount: courses.length),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
