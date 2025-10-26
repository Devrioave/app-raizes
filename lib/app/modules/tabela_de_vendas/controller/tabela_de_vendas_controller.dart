import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TabelaDeVendasController extends GetxController {
  // URL da tabela de vendas no Google Drive
  final String? tabelaUrl = 'https://drive.google.com/drive/folders/1cSaYlbeC8CtlpB-OX-AF9yRQ078-3Rtv?usp=sharing';

  // Status da tabela
  final RxBool isLoading = false.obs;
  final RxString currentMonth = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getCurrentMonth();
  }

  void _getCurrentMonth() {
    final now = DateTime.now();
    final months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];
    currentMonth.value = months[now.month - 1];
  }

  Future<void> openTabelaDeVendas() async {
    if (tabelaUrl != null) {
      isLoading.value = true;
      try {
        final Uri url = Uri.parse(tabelaUrl!);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          Get.snackbar(
            'Erro',
            'Não foi possível abrir a tabela de vendas',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Erro',
          'Erro ao abrir a tabela de vendas',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        'Em breve',
        'A tabela de vendas estará disponível em breve',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
