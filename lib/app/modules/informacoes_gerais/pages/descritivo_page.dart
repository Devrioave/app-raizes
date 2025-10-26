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
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.darkGray,
                ),
                children: [
                  TextSpan(text: "O Raízes resgata o que há de mais vivo no centro do Recife: "),
                  TextSpan(
                    text: "Conexão",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ", "),
                  TextSpan(
                    text: "vida",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " e "),
                  TextSpan(
                    text: "transformação",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ". Um reencontro com a história e com as pessoas.\nUm novo endereço para viver o "),
                  TextSpan(
                    text: "tempo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " e o bairro no seu ritmo."),
                ],
              ),
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
              "Área do Terreno (Masterplan Completo):",
              "50.742,50 m²",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 3.2,
            child: _buildInfoItem(
              "Área do Terreno (Raízes):",
              "21.014,76 m²",
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 3.5,
            child: _buildInfoItem(
              "Área Privativa Total do Raízes:",
              "44.468,61m²",
            ),
          ),
          const SizedBox(height: 24),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 4,
            child: _buildTowerInfoNew(
              "TORRE GILVAN SAMICO",
              fase: "1ª fase",
              items: [
                "30 pavimentos, sendo:",
                "• 23 pavimentos tipo",
                "• 2 pavimentos de cobertura duplex",
                "Apartamentos tipo de 95 m² a 98 m²",
              ],
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 4.5,
            child: _buildTowerInfoNew(
              "TORRE LULA CARDOSO AYRES",
              fase: "1ª fase",
              items: [
                "36 pavimentos, sendo:",
                "• 31 pavimentos tipo",
                "Apartamentos de 50 m² a 58 m²",
              ],
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 5,
            child: _buildTowerInfoNew(
              "TORRE TEREZA COSTA RÊGO",
              fase: "2ª fase",
              items: [
                "32 pavimentos, sendo:",
                "• 29 pavimentos tipo",
                "• 2 pavimentos de cobertura duplex",
              ],
              isSecondPhase: true,
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 5.5,
            child: _buildTowerInfoNew(
              "TORRE CÍCERO DIAS",
              fase: "1ª fase",
              items: [
                "32 pavimentos no total, sendo:",
                "• 29 pavimentos tipo",
                "• 2 pavimentos de coberturas lineares",
                "Apartamentos de 55 m² a 74 m²",
              ],
            ),
          ),
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            delay: kThemeAnimationDuration * 6,
            child: _buildTowerInfoNew(
              "TORRE ABELARDO DA HORA",
              fase: "2ª fase",
              items: [
                "29 pavimentos no total, sendo:",
                "• 28 pavimentos tipo",
              ],
              isSecondPhase: true,
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

  Widget _buildTowerInfoNew(
    String towerName, {
    required String fase,
    required List<String> items,
    bool isSecondPhase = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSecondPhase ? AppColors.lightBeige.withValues(alpha: 0.5) : AppColors.lightBeige,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSecondPhase
              ? AppColors.primaryGreen.withValues(alpha: 0.2)
              : AppColors.primaryGreen.withValues(alpha: 0.3),
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
              color: isSecondPhase
                  ? AppColors.darkGreen.withValues(alpha: 0.6)
                  : AppColors.darkGreen,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isSecondPhase
                  ? AppColors.iconColor.withValues(alpha: 0.3)
                  : AppColors.primaryGreen.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              fase,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSecondPhase
                    ? AppColors.darkGray.withValues(alpha: 0.7)
                    : AppColors.darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 15,
                color: isSecondPhase
                    ? AppColors.darkGray.withValues(alpha: 0.7)
                    : AppColors.darkGray,
                height: 1.4,
              ),
            ),
          )).toList(),
        ],
      ),
    );
  }
}
