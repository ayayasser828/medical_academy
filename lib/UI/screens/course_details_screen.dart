import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_academy/UI/screens/session_screen.dart';
import 'package:medical_academy/UI/widgets/session_card.dart';
import 'package:medical_academy/constant/colors.dart';
import 'package:medical_academy/constant/strings.dart';
import '../../bussiness_logic/courses/courses_cubit.dart';
import '../../data/models/course_model.dart';
import '../widgets/loading_indecator.dart';
import '../widgets/text_button.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key, required this.id}) : super(key: key);

  final id;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
    BlocProvider.of<CoursesCubit>(context).getOneCourse(widget.id.toString());
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  CourseModel? courseModel;
  List<Session> session = [];
  bool enrollIn = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OneCourseLoading) {
          showLoadingIndicator();
        }
        if (state is OneCourseLoaded) {
          courseModel = state.courseModel;
          session = state.courseModel.sessions!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: white,
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: blue,
                  ),
                  onPressed: () => Navigator.pop(context)),
              title: Text(
                courseModel!.course!.name.toString(),
                style: TextStyle(color: blue),
              ),
            ),
            backgroundColor: white,
            body: ListView(
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.network(
                    courseModel!.course!.imagePath.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'instructor : ',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: courseModel!.course!.instructorName
                                  .toString(),
                              style: TextStyle(color: blue, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'price : ',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: courseModel!.course!.price.toString(),
                              style: TextStyle(color: blue, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'description : ',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: courseModel!.course!.description.toString(),
                              style: TextStyle(color: black, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                        child: Container(
                          width: width * 0.7,
                          height: height * 0.003,
                          color: grey,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        'Sessions',
                        style: GoogleFonts.pacifico(color: blue, fontSize: 25),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: courseModel!.ifEnrolled!
                            ? height * 0.4
                            : height * 0.29,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  if (courseModel!.ifEnrolled!) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SessionScreen(
                                                  courseID: widget.id,
                                                  sessionID: courseModel!
                                                      .sessions![index].id,
                                                )));
                                  }
                                },
                                child: sessions(context,
                                    session[index].name.toString(), index + 1)),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 15,
                                ),
                            itemCount: session.length),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                courseModel!.ifEnrolled!
                    ? Container()
                    : Center(
                        child: MyButtonWidget(
                            btnTxt: 'Enroll',
                            btnWidth: width * 0.85,
                            btnHeight: height * 0.06,
                            onPressed: () {}),
                      ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
