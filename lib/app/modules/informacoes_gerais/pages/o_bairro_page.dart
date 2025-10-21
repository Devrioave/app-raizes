import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';

class ObairroPage extends StatelessWidget {
  const ObairroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'No eixo de mobilidade central do Recife, com acesso fácil à Zona Norte e à Zona Sul, o Raízes veio para receber diferentes estilos de vida, oferecendo mais tempo e mais possibilidades.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Em uma localização que permite com que tudo esteja ao seu alcance e no seu tempo, é um lugar para se viver por inteiro: uma vida cercada de vida.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Um lugar para viver por inteiro, cercado de vida.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppColors.darkGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
