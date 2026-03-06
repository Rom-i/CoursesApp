import 'package:courses_app/features/courses_videos/data/models/courses_videos_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.coursesVideosModel});
  final CoursesVideosModel coursesVideosModel;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.coursesVideosModel.videoUrl),)
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager?.videoPlayerController;
    return Scaffold(
      body: 
      controller == null ? const Center(child: CircularProgressIndicator()) :
      controller.value.hasError ? Center(child: Text('Someting wrong'),):
      controller.value.isInitialized ?
      AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: FlickVideoPlayer(
          flickManager: flickManager
          ),
        ): Center(child: CircularProgressIndicator()),
      );
  }
}