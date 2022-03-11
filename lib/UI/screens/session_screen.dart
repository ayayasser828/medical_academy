
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key, this.courseID, this.sessionID}) : super(key: key);

  final courseID;
  final sessionID;

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
    //BlocProvider.of<CoursesCubit>(context).getOneCourse(widget.id.toString());
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
