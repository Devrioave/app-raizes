// ignore_for_file: constant_identifier_names

abstract class Routes {
  Routes._();
  static const AREAS_COMUNS = _Paths.AREAS_COMUNS;

  static const HOME = _Paths.HOME;

  static const PLANTAS = _Paths.PLANTAS;
  static const INFORMACOES_GERAIS = _Paths.INFORMACOES_GERAIS;
  static const TECNOLOGIA = _Paths.TECNOLOGIA;

  static const LOCALIZACAO = _Paths.LOCALIZACAO;
  static const VIDEOS = _Paths.VIDEOS;
  static const TABELA_DE_VENDAS = _Paths.TABELA_DE_VENDAS;
  static const DISCLAIMER = _Paths.DISCLAIMER;
}

abstract class _Paths {
  _Paths._();
  static const AREAS_COMUNS = '/areas_comuns';

  static const PLANTAS = '/plantas';
  static const INFORMACOES_GERAIS = '/informacoes_gerais';
  static const TECNOLOGIA = '/tecnologia';

  static const HOME = '/home';
  static const LOCALIZACAO = '/localizacao';
  static const VIDEOS = '/videos';
  static const TABELA_DE_VENDAS = '/tabela_de_vendas';
  static const DISCLAIMER = '/disclaimer';
}
