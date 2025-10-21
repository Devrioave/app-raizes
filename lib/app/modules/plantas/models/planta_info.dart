import 'package:raizes/app/modules/plantas/models/arquiteto.dart';
import 'package:raizes/app/modules/plantas/models/descricao_planta.dart';

class PlantaInfo {
  final Arquiteto arquiteto;
  final String plantaImg;
  final String plantaArquitetoImg;
  final String icone;
  final DescricaoPlanta descricao;
  final double area;
  const PlantaInfo({
    required this.arquiteto,
    required this.plantaImg,
    required this.plantaArquitetoImg,
    required this.icone,
    required this.descricao,
    required this.area,
  });
}
