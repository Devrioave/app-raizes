import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:raizes/app/components/youtube_player_container.dart';

class VideosController extends GetxController {
  // Lista de vídeos disponíveis
  final RxList<VideoItem> videos = <VideoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadVideos();
  }

  void _loadVideos() {
    videos.value = [
      VideoItem(
        title: "Filme Produto",
        description: "Conheça todos os detalhes do Empreendimento Raízes",
        isAvailable: true,
        videoUrl: 'https://www.youtube.com/watch?v=xywfgKlpX4o',
      ),
    ];
  }

  void playVideo(BuildContext context, VideoItem video) {
    if (video.isAvailable && video.videoUrl != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Center(
                  child: YoutubeVideoPlayerContainer(
                    url: video.videoUrl!,
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 32),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      Get.snackbar(
        'Em breve',
        'Este vídeo estará disponível em breve',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class VideoItem {
  final String title;
  final String description;
  final bool isAvailable;
  final String? videoUrl;

  VideoItem({
    required this.title,
    required this.description,
    required this.isAvailable,
    this.videoUrl,
  });
}
