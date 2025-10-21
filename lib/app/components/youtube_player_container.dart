import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerContainer extends StatefulWidget {
  const YoutubeVideoPlayerContainer({Key? key, required this.url})
      : super(key: key);
  final String url;

  @override
  _YoutubeVideoPlayerContainerState createState() =>
      _YoutubeVideoPlayerContainerState();
}

class _YoutubeVideoPlayerContainerState
    extends State<YoutubeVideoPlayerContainer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.url,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: _initializeVideoPlayerFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (widget.fillSize) {
    //         return SizedBox.expand(
    //           child: FittedBox(
    //             alignment: Alignment.center,
    //             fit: BoxFit.cover,
    //             child: SizedBox(
    //               width: _controller.value.size.width,
    //               height: _controller.value.size.height,
    //               child: VideoPlayer(_controller),
    //             ),
    //           ),
    //         );
    //       } else {
    //         return FittedBox(
    //           child: SizedBox(
    //             width: _controller.value.size.width,
    //             height: _controller.value.size.height,
    //             child: VideoPlayer(_controller),
    //           ),
    //           fit: BoxFit.fitWidth,
    //         );
    //       }
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return FittedBox(
          child: SizedBox(
            // width: _controller.value.size.width,
            // height: _controller.value.size.height,
            child: player,
          ),
          fit: BoxFit.fitWidth,
        );
      },
    );
  }
}
