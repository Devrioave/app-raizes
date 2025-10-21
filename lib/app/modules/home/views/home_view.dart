import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/modules/home/controller/home_controller.dart';

import '../../../components/youtube_player_container.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Image.asset(
              'assets/images/Marca-home.png',
              fit: BoxFit.contain,
              height: 60,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Image.asset(
              'assets/images/Marca-rio-ave.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
        ],
      ),
      actionsBuilder: () => [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  backgroundColor: Colors.black,
                  body: Stack(
                    children: [
                      const Center(
                        child: YoutubeVideoPlayerContainer(
                          url: '',
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        right: 24,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Fechar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.video_camera_front),
        ),
      ],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/videos/fachada-nova.tiff',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text(
                'Erro ao carregar imagem',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
