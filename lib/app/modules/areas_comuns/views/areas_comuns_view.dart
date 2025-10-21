import 'package:collection/collection.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/components/toggle_button.dart';
import 'package:raizes/app/modules/areas_comuns/controller/areas_comuns_controller.dart';
import 'package:raizes/app/modules/areas_comuns/views/components/area_images_view.dart';
import 'package:raizes/app/modules/areas_comuns/views/components/drawer_info_tile.dart';
import 'package:raizes/app/modules/areas_comuns/views/components/interactive_button.dart';
import 'package:raizes/app/themes/app_themes.dart';

import '../models/data.dart';

class AreasComunsView extends GetView<AreasComunsController> {
  AreasComunsView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text("Áreas comuns"),
      actionsBuilder: () => [
        Builder(builder: (context) {
          return IconButton(
            onPressed: () => _launchGalery(context, null),
            icon: const Icon(Icons.image_outlined),
          );
        }),
        Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: const Icon(Icons.info_outline),
          );
        }),
      ],
      body: Container(
        color: AppColors.softWhite,
        child: Stack(
          children: [
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.6,
                child: Image.asset('assets/images/pattern1.png'),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                Obx(() {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: areasComuns
                          .mapIndexed(
                            (index, area) => ToggleButton(
                              title: area.name,
                              toggled: index == controller.currentTab.value,
                              onTap: () => controller.currentTab.value = index,
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => PageTransitionSwitcher(
                      duration: kThemeAnimationDuration * 4,
                      layoutBuilder: (List<Widget> entries) {
                        return Stack(
                          children: entries,
                          alignment: Alignment.topCenter,
                        );
                      },
                      transitionBuilder: (Widget child,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return FadeThroughTransition(
                          fillColor: Colors.transparent,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.pureWhite,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: AppColors.softWhite,
                            child: InteractiveViewer(
                              key: ValueKey(controller.currentTab.value),
                              maxScale: 5,
                              minScale: 1.2,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Transform.scale(
                                      scale: (areasComuns[controller.currentTab.value].name == 'G2' ||
                                             areasComuns[controller.currentTab.value].name == 'G3' ||
                                             areasComuns[controller.currentTab.value].name == 'LAZER') ? 1.1 : 1.3,
                                      child: Image.asset(
                                          areasComuns[controller.currentTab.value]
                                              .plantaImg,
                                          key: ValueKey('${areasComuns[controller.currentTab.value].plantaImg}_v2'),
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                          height: double.infinity,
                                          cacheWidth: null,
                                          cacheHeight: null,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: AppColors.softWhite,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.image_not_supported,
                                                      size: 48,
                                                      color: AppColors.iconColor.withValues(alpha: 0.5),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'Imagem não encontrada',
                                                      style: TextStyle(
                                                        color: AppColors.iconColor.withValues(alpha: 0.7),
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                      ),
                                    ...areasComuns[controller.currentTab.value]
                                        .locais
                                        .map(
                                          (local) => InteractiveButton(
                                            name: local.number.toString(),
                                            relativeOffset: FractionalOffset(
                                              local.relativeLocation.px,
                                              local.relativeLocation.py,
                                            ),
                                            onPressed: local.imgPath == null
                                                ? null
                                                : () => _launchGalery(
                                                    context, local.imgPath),
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: AppColors.softWhite,
        child: Obx(
          () {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: AppColors.primaryGreen,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 64, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          areasComuns[controller.currentTab.value].name.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.pureWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${areasComuns[controller.currentTab.value].locais.where((local) => local.imgPath != null).length} áreas com fotos disponíveis",
                          style: const TextStyle(
                            color: AppColors.lightBeige,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "ÁREAS DISPONÍVEIS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  ...areasComuns[controller.currentTab.value]
                      .locais
                      .map(
                        (local) => DrawerLocalInfoTile(
                          number: local.number.toString(),
                          title: local.description,
                          onTap: local.imgPath == null
                              ? null
                              : () => _launchGalery(context, local.imgPath),
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Toque nos números para ver as fotos dos ambientes.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchGalery(BuildContext context, String? path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AreaImagesView(
          initialImgPath: path,
        ),
      ),
    );
  }
}
