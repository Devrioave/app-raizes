import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoScreen extends StatefulWidget {
  const YoutubeVideoScreen({Key? key, required this.videoUrl})
      : super(key: key);

  final String videoUrl;

  @override
  _YoutubeVideoScreenState createState() => _YoutubeVideoScreenState();
}

class _YoutubeVideoScreenState extends State<YoutubeVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(mute: false, autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}

class YtPlayIcon extends StatelessWidget {
  const YtPlayIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Icon(
          Icons.play_arrow_rounded,
          size: 48,
          color: Colors.white54,
        ),
      ),
    );
  }
}
