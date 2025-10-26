import 'package:flutter/material.dart';
import 'package:raizes/app/components/vertical_appear.dart';
import 'package:raizes/app/themes/app_themes.dart';

class ProjetistasPage extends StatelessWidget {
  const ProjetistasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppearAnimation(
            duration: kThemeAnimationDuration * 3,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(24),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkGreen,
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text: "RAÍZES",
                      style: TextStyle(fontSize: 28),
                    ),
                    TextSpan(text: ":\nONDE GRANDES TALENTOS\nSE ENCONTRAM PARA\nCRIAR O EXTRAORDINÁRIO."),
                  ],
                ),
              ),
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 3,
            delay: kThemeAnimationDuration * 2,
            offset: 10,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildProjetista(
                    nome: 'Metro Arquitetura',
                    especialidade: 'Projeto Arquitetônico',
                    imagem: 'assets/images/projetistas/Metro Arquitetura - Projeto Arquitetônico/Fotos/Metro Arquitetura.JPG',
                    descricaoBuilder: () => [
                      TextSpan(text: '"Quando recebemos esse projeto, sabíamos da responsabilidade. Era muito mais que erguer edifícios — era criar um novo jeito de '),
                      TextSpan(
                        text: 'habitar o centro da cidade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '. Este é um empreendimento '),
                      TextSpan(
                        text: 'inovador',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', nunca visto antes na '),
                      TextSpan(
                        text: 'cidade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' do Recife.\n\nEle vai funcionar como um ecossistema, onde os moradores poderão viver o local de forma integrada com tudo ao seu redor. Um empreendimento que se conecta com a cidade, com o '),
                      TextSpan(
                        text: 'bairro',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' e com as '),
                      TextSpan(
                        text: 'pessoas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '."'),
                    ],
                    alignment: Alignment.center,
                  ),
                  _buildProjetista(
                    nome: 'Juliano Dubeux',
                    especialidade: 'Projeto Urbanístico',
                    imagem: 'assets/images/projetistas/Juliano Dubeux - Projeto Urbanístico/Fotos/_O1A7767.jpg',
                    descricaoBuilder: () => [
                      TextSpan(text: '"Desde o início, nossa intenção era clara: criar um projeto que '),
                      TextSpan(
                        text: 'dialogasse com a cidade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '. Que respeitasse a memória da Boa Vista, sua arquitetura histórica, suas '),
                      TextSpan(
                        text: 'ruas vivas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', seu patrimônio, mas que também olhasse para o '),
                      TextSpan(
                        text: 'futuro',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '. Esse projeto é um passo importante na revitalização urbana do bairro.\n\nPara concretizar essa ideia, buscamos os parceiros certos — e a Metro foi essencial para dar forma a esse sonho."'),
                    ],
                    alignment: Alignment(0, -0.6),
                  ),
                  _buildProjetista(
                    nome: 'Sérgio Santana',
                    especialidade: 'Paisagismo',
                    imagem: 'assets/images/projetistas/Sérgio Santana - Paisagista/Foto Institucional/FOTO INSTITUCIONAL SERGIO SANTANA.png',
                    descricaoBuilder: () => [
                      TextSpan(text: '"No centro do Raízes, mais de '),
                      TextSpan(
                        text: '10 mil metros',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' quadrados se abre como um presente para a cidade. Um espaço vivo que conecta '),
                      TextSpan(
                        text: 'natureza e urbanidade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', para moradores e para todos que passam por aqui.\n\nO verde aqui não é cenário, é '),
                      TextSpan(
                        text: 'experiência',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '. Sombra natural, ar mais puro, brisa entre as árvores… são sensações que tornam o dia a dia mais leve, mais saudável, mais humano. E traz mais bem-estar e '),
                      TextSpan(
                        text: 'qualidade de vida',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '."'),
                    ],
                    alignment: Alignment.topCenter,
                  ),
                  _buildProjetista(
                    nome: 'Zirpoli Arquitetura',
                    especialidade: 'Interiores',
                    imagem: 'assets/images/projetistas/Zirpoli - Interiores/Fotos/Cópia de RWC_4701.JPG',
                    descricaoBuilder: () => [
                      TextSpan(text: '"Cada espaço foi pensado para acolher, inspirar e revelar novas formas de viver. A ambientação valoriza a '),
                      TextSpan(
                        text: 'força das origens',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', despertando memórias e celebrando a riqueza cultural da região.\n\nCores, texturas e detalhes convidam a sentir o lugar. Com arte local, referências históricas e materiais naturais, mantemos viva a essência do bairro, equilibrando '),
                      TextSpan(
                        text: 'tradição e contemporaneidade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '."'),
                    ],
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjetista({
    required String nome,
    required String especialidade,
    required String imagem,
    required List<TextSpan> Function() descricaoBuilder,
    required Alignment alignment,
  }) {
    return AppearAnimation(
      duration: kThemeAnimationDuration * 2,
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: AppColors.primaryGreen, thickness: 2),
            const SizedBox(height: 16),
            Text(
              especialidade.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.iconColor,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagem,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                alignment: alignment,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGray,
                  height: 1.5,
                ),
                children: descricaoBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
