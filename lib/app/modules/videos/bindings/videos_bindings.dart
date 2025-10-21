import 'package:get/get.dart';
import 'package:raizes/app/modules/videos/controller/videos_controller.dart';

class VideosBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      VideosController(),
    );
  }
}
