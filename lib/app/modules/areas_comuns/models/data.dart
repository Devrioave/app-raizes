import 'area_comum.dart';

const areasComuns = [
  // SEMIENTERRADO - Conforme planta RAIZ_CMP_AP_001_BOL-SEMI_R00.png
  AreaComum(
    'SEMIENTERRADO',
    'assets/images/plantas/GERAL/RAIZ_CMP_AP_001_BOL-SEMI_R00.png',
    [
      Local(
        1,
        "Bicicletário",
        'assets/images/areas_comuns/144_Bclt_02.jpg',
        LocationPercent(
            0.32, 0.53), // Posição do ponto 1 na imagem - superior esquerda
      ),
      Local(
        1,
        "Bicicletário",
        'assets/images/areas_comuns/144_Bclt_02.jpg',
        LocationPercent(
            0.45, 0.51), // Posição do ponto 1 na imagem - superior esquerda
      ),
      Local(
        1,
        "Bicicletário",
        'assets/images/areas_comuns/144_Bclt_02.jpg',
        LocationPercent(
            0.62, 0.53), // Posição do ponto 1 na imagem - superior esquerda
      ),
      Local(
        2,
        "Car Wash / Bike Station",
        'assets/images/areas_comuns/143_Car_Wash_04.jpg',
        LocationPercent(0.61, 0.49), // Posição do ponto 2 na imagem - superior central-direita
      ),
      Local(
        3,
        "Espaço Delivery",
        'assets/images/areas_comuns/009_Aces_04.jpg',
         LocationPercent(0.45, 0.54), // Posição do ponto 3 na imagem - central-esquerda
      ),
      Local(
        4,
        "Espaço Maker",
        'assets/images/areas_comuns/121_Maker_03.jpg',
        LocationPercent(0.80, 0.66), // Posição do ponto 4 na imagem - inferior direita
      ),
    ],
  ),

  // TÉRREO - Conforme planta RAIZ_CMP_AP_002_BOL-TÉRREO_R00.png
  AreaComum(
    'TÉRREO',
    'assets/images/plantas/GERAL/RAIZ_CMP_AP_002_BOL-TERREO_R00.png',
    [
      Local(
        5,
        "Padaria",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BF_0008_PADARIA.jpg',
        LocationPercent(0.24, 0.45),
      ),
      Local(
        6,
        "Coworking (com salas de reunião e sala de podcast)",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BF_0006_COWORKING.jpg',
         LocationPercent(0.29, 0.45),
      ),
      Local(
        7,
        "Salão de beleza",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BF_0009_SALÃO DE BELEZA.jpg',
        LocationPercent(0.34, 0.45),
      ),
      Local(
        8,
        "Salão de Festas (Torre Lula Cardoso Ayres)",
        'assets/images/areas_comuns/126_Fest_F_04.jpg',
        LocationPercent(0.37, 0.51),
      ),
      Local(
        9,
        "Praça de Chegada",
        'assets/images/areas_comuns/002_Prca_Entrada_03.jpg',
        LocationPercent(0.50, 0.30),
      ),
      Local(
        10,
        "Salão de Festas (Torre Abelardo da Hora)",
        'assets/images/areas_comuns/118_Fest_I_03.jpg',
         LocationPercent(0.22, 0.54),
      ),
      Local(
        11,
        "Brinquedoteca (6-11 anos)",
        'assets/images/areas_comuns/117_Kids_5-11_04.jpg',
        LocationPercent(0.30, 0.56),
      ),
      Local(
        12,
        "Espaço Teens",
        'assets/images/areas_comuns/125_Stud_02.jpg',
         LocationPercent(0.42, 0.55),
      ),
      Local(
        13,
        "Cinema",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BH_0012_CINEMA.jpg',
        LocationPercent(0.42, 0.58),
      ),
      Local(
        14,
        "Estúdio de Música",
        'assets/images/areas_comuns/125_Stud_02.jpg',
        LocationPercent(0.48, 0.55),
      ),
      Local(
        15,
        "Brinquedoteca (2-5 anos)",
        'assets/images/areas_comuns/116_Kids_2-5_06.jpg',
        LocationPercent(0.48, 0.58),
      ),
      Local(
        16,
        "Ateliê",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BG_0011_ATELIÊ.jpg',
        LocationPercent(0.56, 0.58),
      ),
      Local(
        17,
        "Salão de Jogos",
        'assets/images/areas_comuns/115_Jogs_04.jpg',
        LocationPercent(0.62, 0.58),
      ),
      Local(
        18,
        "Quadras de Areia",
        'assets/images/areas_comuns/024_Qdra_Areia_02.jpg',
         LocationPercent(0.60, 0.64),
      ),
      Local(
        19,
        "Arvorismo",
        'assets/images/areas_comuns/023_Arvr_02.jpg',
         LocationPercent(0.57, 0.67),
      ),
      Local(
        20,
        "Churrasqueiras",
        'assets/images/areas_comuns/011_Apoio_Chur_04.jpg',
        LocationPercent(0.58, 0.70),
      ),
      Local(
        21,
        "Playground Big Kids",
        'assets/images/areas_comuns/005_Play_04.jpg',
         LocationPercent(0.49, 0.70),
      ),
      Local(
        22,
        "Playground Small Kids",
        'assets/images/areas_comuns/116_Kids_2-5_06.jpg',
         LocationPercent(0.47, 0.67),
      ),
      Local(
        23,
        "Espaço Piquenique",
        'assets/images/areas_comuns/013_Pikn_03.jpg',
        LocationPercent(0.47, 0.62),
      ),
      Local(
        24,
        "Academia Sênior",
        'assets/images/areas_comuns/123_Jogs_Senr_04.jpg',
        LocationPercent(0.39, 0.61),
      ),
      Local(
        25,
        "Wet Play",
        'assets/images/areas_comuns/007_Pisc_Adlt_04.jpg',
        LocationPercent(0.36, 0.57),
      ),
      Local(
        26,
        "Pet Place",
        'assets/images/areas_comuns/003_Pet_Plce_03.jpg',
        LocationPercent(0.22, 0.60),
      ),
    ],
  ),

  // G2 - Conforme planta RAIZ_CMP_AP_003_BOL-G2_R00.png
  AreaComum(
    'G2',
    'assets/images/plantas/GERAL/RAIZ_CMP_AP_003_BOL-G2_R00.png',
    [
      Local(
        27,
        "Lavanderia",
        'assets/images/areas_comuns/128_Lvnd_04.jpg',
        LocationPercent(0.36, 0.57),
      ),
      Local(
        28,
        "Spa",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BE_0032_WELLNESS V01.jpg',
         LocationPercent(0.03, 0.51),
      ),
    ],
  ),

  // G3 - Conforme planta RAIZ_CMP_AP_004_BOL-G3_R00.png
  AreaComum(
    'G3',
    'assets/images/plantas/GERAL/RAIZ_CMP_AP_004_BOL-G3_R00.png',
    [
      Local(
        29,
        "Salas de Massagem",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BE_0034_SALA DE MASSAGEM.jpg',
        LocationPercent(0.37, 0.56),
      ),
      Local(
        30,
        "Pet Wash",
        'assets/images/areas_comuns/129_Pet_Wash_05.jpg',
        LocationPercent(0.03, 0.50),
      ),
    ],
  ),

  // LAZER - Conforme planta RAIZ_CMP_AP_005_BOL-LAZER_R00.png
  AreaComum(
    'LAZER',
    'assets/images/plantas/GERAL/RAIZ_CMP_AP_005_BOL-LAZER_R00.png',
    [
      Local(
        31,
        "Academia",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BE_0035_ACADEMIA V01.jpg',
         LocationPercent(0.05, 0.53),
      ),
      Local(
        32,
        "Playground Montessoriano",
        'assets/images/areas_comuns/005_Play_04.jpg',
       LocationPercent(0.24, 0.51),
      ),
      Local(
        33,
        "Sports Bar",
        'assets/images/areas_comuns/127_Sport_Bar_03.jpg',
        LocationPercent(0.37, 0.50),
      ),
      Local(
        34,
        "Wine Bar",
        'assets/images/areas_comuns/122_Wine_04.jpg',
        LocationPercent(0.46, 0.48),
      ),
      Local(
        35,
        "Terraço Wine",
        'assets/images/areas_comuns/122_Wine_04.jpg',
        LocationPercent(0.46, 0.52),
      ),
      Local(
        36,
        "Mini Market",
        'assets/images/areas_comuns/RAIZ_IMG_AC_BF_0037_MINI MARKET.jpg',
        LocationPercent(0.38, 0.54),
      ),
      Local(
        37,
        "Salão de Festas Petit com Terraço",
        'assets/images/areas_comuns/124_Fest_Ptit_03.jpg',
        LocationPercent(0.40, 0.58),
      ),
      Local(
        38,
        "Lounge",
        'assets/images/areas_comuns/127_Sport_Bar_03.jpg',
        LocationPercent(0.42, 0.62),
      ),
      Local(
        39,
        "Piscina Adulta",
        'assets/images/areas_comuns/007_Pisc_Adlt_04.jpg',
        LocationPercent(0.65, 0.63),
      ),
      Local(
        40,
        "Deck / Solarium",
        'assets/images/areas_comuns/008_Ftns_Extn_3id_03.jpg',
        LocationPercent(0.75, 0.60),
      ),
      Local(
        41,
        "Bar da Piscina",
        'assets/images/areas_comuns/127_Sport_Bar_03.jpg',
        LocationPercent(0.99, 0.61),
      ),
      Local(
        42,
        "Piscina Infantil",
        'assets/images/areas_comuns/016_Pisc_Inft_03.jpg',
        LocationPercent(0.60, 0.54),
      ),
      Local(
        43,
        "Quadra Poliesportiva",
        'assets/images/areas_comuns/024_Qdra_Areia_02.jpg',
        LocationPercent(0.55, 0.43),
      ),
      Local(
        44,
        "Churrasqueira",
        'assets/images/areas_comuns/011_Apoio_Chur_04.jpg',
        LocationPercent(0.40, 0.42),
      ),
      Local(
        45,
        "Campo Society",
        'assets/images/areas_comuns/021_Aerea_Qdras_04.jpg',
        LocationPercent(0.24, 0.42),
      ),
      Local(
        46,
        "Campinho",
        'assets/images/areas_comuns/021_Aerea_Qdras_04.jpg',
        LocationPercent(0.09, 0.42),
      ),
    ],
  ),
];
