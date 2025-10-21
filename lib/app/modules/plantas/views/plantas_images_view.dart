import 'package:flutter/material.dart';
import 'package:raizes/app/modules/plantas/models/data.dart';

import '../controller/plantas_controller.dart';

class PlantasImagesView extends StatelessWidget {
  const PlantasImagesView({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    final images = place == Place.destiny ? destinyImages : heritageImages;
    final _pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Image.asset(images[index]),
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) {
                    var currentPage = 0.0;
                    if (_pageController.hasClients) {
                      currentPage = _pageController.page ?? 0;
                    }
                    final percent = (1.0 - (index - currentPage).abs().clamp(0, 1)).toDouble();
                    final color = Theme.of(context).colorScheme.primary;
                    return Container(
                      decoration: BoxDecoration(
                        color: color.withOpacity(percent),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: color,
                          width: 1.5,
                        ),
                      ),
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
