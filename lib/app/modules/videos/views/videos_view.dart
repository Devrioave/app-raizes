import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/modules/videos/controller/videos_controller.dart';
import 'package:raizes/app/themes/app_themes.dart';

class VideosView extends GetView<VideosController> {
  const VideosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text("Vídeos"),
      body: Container(
        color: AppColors.white,
        child: Obx(() {
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: controller.videos.length,
            itemBuilder: (context, index) {
              final video = controller.videos[index];
              return _buildVideoCard(context, video);
            },
          );
        }),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, VideoItem video) {
    return GestureDetector(
      onTap: () => controller.playVideo(context, video),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGray.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: video.isAvailable
                          ? AppColors.primaryGreen
                          : AppColors.mediumGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      video.isAvailable ? Icons.play_arrow : Icons.hourglass_empty,
                      color: AppColors.pureWhite,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          video.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: video.isAvailable
                      ? AppColors.iconColor
                      : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  video.isAvailable ? "ASSISTIR AGORA" : "EM BREVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: video.isAvailable ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
