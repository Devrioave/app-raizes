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
              child: Text(
                "RAÍZES:\nONDE GRANDES TALENTOS\nSE ENCONTRAM PARA\nCRIAR O EXTRAORDINÁRIO.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkGreen,
                  height: 1.3,
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
                    descricao: 'Quando recebemos esse projeto, sabíamos da responsabilidade. Era muito mais que erguer edifícios — era criar um novo jeito de habitar o centro da cidade. Este é um empreendimento inovador, nunca visto antes na cidade do Recife.\n\nEle vai funcionar como um ecossistema, onde os moradores poderão viver o local de forma integrada com tudo ao seu redor. Um empreendimento que se conecta com a cidade, com o bairro e com as pessoas.',
                  ),
                  _buildProjetistaCustom(
                    nome: 'Juliano Dubeux',
                    especialidade: 'Projeto Urbanístico',
                    imagem: 'assets/images/projetistas/Juliano Dubeux - Projeto Urbanístico/Fotos/_O1A7767.jpg',
                    descricao: 'Desde o início, nossa intenção era clara: criar um projeto que dialogasse com a cidade. Que respeitasse a memória da Boa Vista, sua arquitetura histórica, suas ruas vivas, seu patrimônio, mas que também olhasse para o futuro. Esse projeto é um passo importante na revitalização urbana do bairro.\n\nPara concretizar essa ideia, buscamos os parceiros certos — e a Metro foi essencial para dar forma a esse sonho.',
                    alignment: Alignment(0, -0.6),
                  ),
                  _buildProjetista(
                    nome: 'Sérgio Santana',
                    especialidade: 'Paisagismo',
                    imagem: 'assets/images/projetistas/Sérgio Santana - Paisagista/Foto Institucional/FOTO INSTITUCIONAL SERGIO SANTANA.png',
                    descricao: 'No centro do Raízes, mais de 10 mil metros quadrados se abre como um presente para a cidade. Um espaço vivo que conecta natureza e urbanidade, para moradores e para todos que passam por aqui.\n\nO verde aqui não é cenário, é experiência. Sombra natural, ar mais puro, brisa entre as árvores… são sensações que tornam o dia a dia mais leve, mais saudável, mais humano. E traz mais bem-estar e qualidade de vida.',
                  ),
                  _buildProjetista(
                    nome: 'Zirpoli Arquitetura',
                    especialidade: 'Interiores',
                    imagem: 'assets/images/projetistas/Zirpoli - Interiores/Fotos/Cópia de RWC_4701.JPG',
                    descricao: 'Cada espaço foi pensado para acolher, inspirar e revelar novas formas de viver. A ambientação valoriza a força das origens, despertando memórias e celebrando a riqueza cultural da região.\n\nCores, texturas e detalhes convidam a sentir o lugar. Com arte local, referências históricas e materiais naturais, mantemos viva a essência do bairro, equilibrando tradição e contemporaneidade.',
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
    required String descricao,
  }) {
    return _buildProjetistaCustom(
      nome: nome,
      especialidade: especialidade,
      imagem: imagem,
      descricao: descricao,
      alignment: Alignment.topCenter,
    );
  }

  Widget _buildProjetistaCustom({
    required String nome,
    required String especialidade,
    required String imagem,
    required String descricao,
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
            Text(
              descricao,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.darkGray,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
