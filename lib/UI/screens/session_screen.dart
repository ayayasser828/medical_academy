import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:medical_academy/data/models/session_model.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../bussiness_logic/courses/courses_cubit.dart';
import '../../constant/colors.dart';
import '../widgets/loading_indecator.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen(
      {Key? key, required this.courseID, required this.sessionID})
      : super(key: key);

  final String courseID;
  final String sessionID;

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  VideoPlayerController? _controller;
  YoutubePlayerController? controller;

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
    BlocProvider.of<CoursesCubit>(context)
        .getSession(widget.courseID, widget.sessionID);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    // controller = YoutubePlayerController(
    //     initialVideoId: 'FTgkxY1KVf8',
    //   params: const YoutubePlayerParams(
    //     loop: false,
    //     color: 'transparent',
    //     desktopMode: false,
    //     strictRelatedVideos: false,
    //     autoPlay: false,
    //     privacyEnhanced: true,
    //     useHybridComposition: false,
    //     showControls: false,
    //     enableCaption: false,
    //     enableKeyboard: false,
    //     enableJavaScript: false,
    //     showVideoAnnotations: false,
    //     playsInline: false,
    //   )
    // );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _controller!.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  SessionModel? sessionModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SessionLoading) {
          showLoadingIndicator();
        }
        if (state is SessionLoaded) {
          sessionModel = state.sessionModel;
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
                sessionModel!.session!.name.toString(),
                style: TextStyle(color: blue),
              ),
            ),
            backgroundColor: white,
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height*0.8,
                      width: width,
                      child: const VimeoPlayer(videoId: '687761777',),
                    ),
                    // SizedBox(
                    //   height: height*0.4,
                    //   width: width,
                    //   child: YoutubePlayerControllerProvider(
                    //     controller: controller!,
                    //     child: YoutubePlayerIFrame(
                    //       controller: controller,
                    //     ),
                    //   ),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //       _controller!.value.isPlaying
                    //           ? _controller!.pause()
                    //           : _controller!.play();
                    //     });
                    //   },
                    //   child: Stack(
                    //     children: [
                    //       Center(
                    //         child: _controller!.value.isInitialized
                    //             ? AspectRatio(
                    //                 aspectRatio: _controller!.value.aspectRatio,
                    //                 child: VideoPlayer(_controller!),
                    //               )
                    //             : showLoadingIndicator(),
                    //       ),
                    //       _controller!.value.isPlaying
                    //           ? Container()
                    //           : Padding(
                    //               padding: const EdgeInsets.only(top: 60.0),
                    //               child: Center(
                    //                   child: Icon(
                    //                 Icons.play_arrow,
                    //                 color: white,
                    //                 size: 70,
                    //               )),
                    //             )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Description : ',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: sessionModel!.session!.description
                                      .toString(),
                                  style: TextStyle(color: blue, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Created at : ',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: sessionModel!.session!.createdAt
                                      .toString(),
                                  style: TextStyle(color: blue, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Updated at : ',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: sessionModel!.session!.updatedAt
                                      .toString(),
                                  style: TextStyle(color: blue, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
