import 'package:get/get.dart';

enum SubPages { descritivo, projetistas, oBairro }

class InformacoesGeraisController extends GetxController {
  var currentPage = const [SubPages.descritivo].obs;
}
