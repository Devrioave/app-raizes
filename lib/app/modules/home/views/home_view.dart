import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/modules/home/controller/home_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:raizes/app/components/youtube_player_container.dart';
import 'package:raizes/app/components/raizes_drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: const RaizesDrawer(token: null),
      ),
      body: Stack(
        children: [
          // Vídeo de fundo - posicionado entre as barras
          Positioned(
            top: 80, // Altura da barra superior
            bottom: 80, // Altura da barra inferior
            left: 0,
            right: 0,
            child: Obx(() {
              final videoController = controller.videoController.value;
              if (videoController != null && videoController.value.isInitialized) {
                return FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: videoController.value.size.width,
                    height: videoController.value.size.height,
                    child: VideoPlayer(videoController),
                  ),
                );
              }
              return Container(color: Colors.black);
            }),
          ),

          // Header com menu e logo RAIZES
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF5D7052),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu hamburger
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white, size: 24),
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),

                    // Logo RAIZES
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/images/Marca-home.png',
                          height: 35,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Ícone de play
                    IconButton(
                      icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 28),
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
                                      url: 'https://www.youtube.com/watch?v=xywfgKlpX4o',
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
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Logo Rio Ave no rodapé
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF5D7052),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/Marca-rio-ave.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
