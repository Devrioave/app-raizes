
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:raizes/app/modules/localizacao/components/maps_dialog.dart';
// Removido map_launcher e google_maps_flutter - usando apenas imagem estática como mapa

class LocalizacaoController extends GetxController {
  void openMapsSheet({required BuildContext context}) async {
    showImageMapDialog(context: context);
  }
}
