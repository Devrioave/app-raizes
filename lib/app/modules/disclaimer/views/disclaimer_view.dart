import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/modules/disclaimer/controller/disclaimer_controller.dart';
import 'package:raizes/app/themes/app_themes.dart';

class DisclaimerView extends GetView<DisclaimerController> {
  const DisclaimerView({Key? key}) : super(key: key);

  final String disclaimerText = """
INFORMAÇÕES LEGAIS E TERMOS DO EMPREENDIMENTO RAÍZES

Este material tem caráter meramente ilustrativo e promocional. As informações aqui contidas são preliminares e estão sujeitas a alterações sem prévio aviso. As imagens, perspectivas, plantas, mobiliário, equipamentos, acabamentos e itens de decoração são sugestões e não fazem parte do contrato de compra e venda, salvo se expressamente mencionados.

O empreendimento RAÍZES será construído conforme projeto aprovado e memorial descritivo que prevalecerá sobre qualquer outra informação. As áreas comuns serão entregues equipadas e decoradas conforme memorial descritivo.

A vegetação apresentada nas ilustrações é meramente representativa e será entregue de acordo com o projeto paisagístico, podendo apresentar diferenças de porte e quantidade.

A RIO AVE se reserva o direito de alterar as especificações do empreendimento, bem como os materiais e acabamentos, sem prévio aviso, em função de necessidades técnicas, legais ou comerciais.

Para maiores informações, consulte o memorial descritivo e o contrato de compra e venda.

INCORPORAÇÃO: RIO AVE EMPREENDIMENTOS S.A.
CNPJ: XX.XXX.XXX/XXXX-XX
ENDEREÇO: Rua da Aurora, 123 - Boa Vista, Recife - PE

Complexo Salesianos:
O Complexo Salesianos é um projeto de revitalização urbana que visa integrar o empreendimento RAÍZES com a história e a cultura do bairro da Boa Vista. As informações sobre o Complexo Salesianos são de caráter informativo e não vinculam a RIO AVE a qualquer obrigação de execução ou manutenção de obras fora dos limites do empreendimento RAÍZES.

Direitos Autorais:
Todo o conteúdo deste aplicativo, incluindo textos, imagens, vídeos e logotipos, é de propriedade exclusiva da RIO AVE EMPREENDIMENTOS S.A. ou de seus licenciadores, e está protegido pelas leis de direitos autorais. Qualquer reprodução, distribuição ou uso não autorizado é proibido.

Ao utilizar este aplicativo, você concorda com os termos e condições aqui estabelecidos.

© 2023 RIO AVE EMPREENDIMENTOS S.A. Todos os direitos reservados.
""";

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text('Disclaimer'),
      body: Container(
        color: AppColors.softWhite,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.lightGray,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGray.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: SelectableText(
                disclaimerText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}