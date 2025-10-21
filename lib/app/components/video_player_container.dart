import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContainer extends StatefulWidget {
  const VideoPlayerContainer(
      {Key? key, required this.videoPath, this.fillSize = true})
      : super(key: key);
  final String videoPath;
  final bool fillSize;

  @override
  _VideoPlayerContainerState createState() => _VideoPlayerContainerState();
}

class _VideoPlayerContainerState extends State<VideoPlayerContainer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoPath);

    _controller.play();

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (widget.fillSize) {
            return SizedBox.expand(
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            );
          } else {
            return FittedBox(
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
              fit: BoxFit.fitWidth,
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
