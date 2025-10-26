import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  final Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      final controller = VideoPlayerController.asset('assets/videos/video_inicial.mp4');
      await controller.initialize();
      controller.setLooping(true);
      controller.setVolume(0.0); // Remove o áudio do vídeo
      controller.play();
      videoController.value = controller;
    } catch (e) {
      print('Erro ao carregar vídeo: $e');
    }
  }

  void togglePlayPause() {
    final controller = videoController.value;
    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    }
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    super.onClose();
  }
}
