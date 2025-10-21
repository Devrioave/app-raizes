class AreaComum {
  final String name;
  final String plantaImg;
  final List<Local> locais;

  const AreaComum(this.name, this.plantaImg, this.locais);
}

class Local {
  final int number;
  final String description;
  final LocationPercent relativeLocation;
  final String? imgPath;
  const Local(this.number, this.description, this.imgPath, this.relativeLocation);
}

// localização na planta em porcentagem do tamanho da imagem da planta
class LocationPercent {
  final double px;
  final double py;
  const LocationPercent(this.px, this.py);
}


