import 'package:flutter/material.dart';
import 'package:raizes/app/components/vertical_appear.dart';
import 'package:raizes/app/themes/app_themes.dart';

class DescritivoPage extends StatelessWidget {
  const DescritivoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            child: Text(
              "Sobre o projeto:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration,
            child: Text(
              "O Raízes resgata o que há de mais vivo no centro do Recife: Conexão, vida e transformação. Um reencontro com a história e com as pessoas.\nUm novo endereço para viver o tempo e o bairro no seu ritmo.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 32),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 2,
            child: Text(
              "Informações Gerais:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 3,
            child: _buildInfoItem(
              "Área total do terreno:",
              "50.742,50 m² (21.014,76 m² Raízes com o empresarial)",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 3.5,
            child: _buildInfoItem(
              "Área privativa total:",
              "44.468,61m²",
            ),
          ),
          const SizedBox(height: 24),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 4,
            child: _buildTowerInfo(
              "Torre Gilvan Samico",
              "31 pavimentos (23 tipos/ 2 pavimentos cobertura duplex); 1ª fase",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 4.5,
            child: _buildTowerInfo(
              "Torre Lula Cardoso Ayres",
              "37 pavimentos (31 tipos); 1ª fase",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 5,
            child: _buildTowerInfo(
              "Torre Tereza Costa Rêgo",
              "33 pavimentos (29 tipos/ 2 pavimentos coberturas linear); 2ª fase",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 5.5,
            child: _buildTowerInfo(
              "Torre Cícero Dias",
              "33 pavimentos (29 tipos/ 2 pavimentos coberturas linear); 1ª fase",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 6,
            child: _buildTowerInfo(
              "Torre Abelardo da Hora",
              "30 pavimentos (28 tipos); 2ª fase",
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 8, right: 12),
            decoration: BoxDecoration(
              color: AppColors.iconColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$title ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTowerInfo(String towerName, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            towerName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.darkGray,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
