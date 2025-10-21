// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:raizes/app/modules/areas_comuns/bindings/areas_comuns_bindings.dart';
import 'package:raizes/app/modules/areas_comuns/views/areas_comuns_view.dart';
import 'package:raizes/app/modules/home/bindings/home_bindings.dart';
import 'package:raizes/app/modules/home/views/home_view.dart';
import 'package:raizes/app/modules/informacoes_gerais/bindings/informacoes_gerais_bindings.dart';
import 'package:raizes/app/modules/informacoes_gerais/views/informacoes_gerais_view.dart';
import 'package:raizes/app/modules/localizacao/localizacao_binding.dart';
import 'package:raizes/app/modules/localizacao/localizacao_view.dart';
import 'package:raizes/app/modules/plantas/bindings/plantas_bindings.dart';
import 'package:raizes/app/modules/plantas/views/plantas_view.dart';
import 'package:raizes/app/modules/tecnologia/bindings/tecnologia_bindings.dart';
import 'package:raizes/app/modules/tecnologia/views/tecnologia_view.dart';
import 'package:raizes/app/modules/videos/bindings/videos_bindings.dart';
import 'package:raizes/app/modules/videos/views/videos_view.dart';
import 'package:raizes/app/modules/tabela_de_vendas/bindings/tabela_de_vendas_bindings.dart';
import 'package:raizes/app/modules/tabela_de_vendas/views/tabela_de_vendas_view.dart';
import 'package:raizes/app/modules/disclaimer/bindings/disclaimer_bindings.dart';
import 'package:raizes/app/modules/disclaimer/views/disclaimer_view.dart';
import 'package:raizes/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.AREAS_COMUNS,
      page: () => AreasComunsView(),
      binding: AreasComunsBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PLANTAS,
      page: () => const PlantasView(),
      binding: PlantasBinding(),
    ),
    GetPage(
      name: Routes.INFORMACOES_GERAIS,
      page: () => const InformacoesGeraisView(),
      binding: InformacoesGeraisBinding(),
    ),
    GetPage(
      name: Routes.TECNOLOGIA,
      page: () => const TecnologiaView(),
      binding: TecnologiaBinding(),
    ),
    GetPage(
      name: Routes.LOCALIZACAO,
      binding: LocalizacaoBinding(),
      page: () => LocalizacaoView(),
    ),
    GetPage(
      name: Routes.VIDEOS,
      page: () => const VideosView(),
      binding: VideosBinding(),
    ),
    GetPage(
      name: Routes.TABELA_DE_VENDAS,
      page: () => const TabelaDeVendasView(),
      binding: TabelaDeVendasBinding(),
    ),
    GetPage(
      name: Routes.DISCLAIMER,
      page: () => const DisclaimerView(),
      binding: DisclaimerBindings(),
    ),
  ];
}
