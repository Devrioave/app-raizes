import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/routes/app_routes.dart';
import 'package:raizes/app/themes/app_themes.dart';

class RaizesDrawer extends StatelessWidget {
  final String? token;
  const RaizesDrawer({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Drawer(
        backgroundColor: AppColors.darkGreen,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Raízes",
                                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.pureWhite,
                ),
              ),
            ),
              DrawerTile(
                onTap: () {
                Get.offNamed(Routes.HOME);
                },
                icon: Icons.home,
                title: "HOME",
                subtitle: "Reencontro com a vida e transformação",
              ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.LOCALIZACAO);
              },
              icon: Icons.location_pin,
              title: "LOCALIZAÇÃO",
              subtitle: "Centro do Recife • Conexão com a história",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.AREAS_COMUNS);
              },
              icon: Icons.star,
              title: "ÁREAS COMUNS",
              subtitle: "Mais de 10.000m² de área verde e lazer",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.PLANTAS);
              },
              icon: Icons.emoji_transportation,
              title: "PLANTAS",
              subtitle: "5 torres • Tipologias de 48m² a 177m²",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.VIDEOS);
              },
              icon: Icons.play_circle_filled,
              title: "VÍDEOS",
              subtitle: "Filme produto • Tour virtual • Sala imersiva",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.TABELA_DE_VENDAS);
              },
              icon: Icons.table_chart,
              title: "TABELA DE VENDAS",
              subtitle: "Valores e condições atualizados mensalmente",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.INFORMACOES_GERAIS);
              },
              icon: Icons.settings,
              title: "INFORMAÇÕES GERAIS",
              subtitle: "Onde grandes talentos se encontram",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.TECNOLOGIA);
              },
              icon: Icons.flash_on_rounded,
              title: "INOVAÇÃO E TECNOLOGIA",
              subtitle: "Segurança • Sustentabilidade • Tecnologia",
            ),
            DrawerTile(
              onTap: () {
                Get.offNamed(Routes.DISCLAIMER);
              },
              icon: Icons.description,
              title: "DISCLAIMER",
              subtitle: "Informações legais e termos do empreendimento",
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.subtitle})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.pureWhite,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.lightGreen, width: 2),
              ),
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(6),
              child: Icon(
                icon,
                size: 20,
                color: AppColors.darkGreen,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureWhite),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                            color: AppColors.lightBeige,
                            fontSize: 11,
                            height: 1,
                          ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
