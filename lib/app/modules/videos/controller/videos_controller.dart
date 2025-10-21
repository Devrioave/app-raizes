import 'package:get/get.dart';

class VideosController extends GetxController {
  // Lista de vídeos disponíveis (placeholder para conteúdo futuro)
  final RxList<VideoItem> videos = <VideoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadVideos();
  }

  void _loadVideos() {
    // Placeholder para quando os vídeos estiverem disponíveis
    videos.value = [
      VideoItem(
        title: "Filme Produto",
        description: "Conheça todos os detalhes do Empreendimento Raízes",
        isAvailable: false,
      ),
      VideoItem(
        title: "Tour Virtual Apple Vision",
        description: "Experiência imersiva em realidade virtual",
        isAvailable: false,
      ),
      VideoItem(
        title: "Sala Imersiva",
        description: "Ambiente virtual interativo do projeto",
        isAvailable: false,
      ),
    ];
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
