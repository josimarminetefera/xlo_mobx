import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/chave_repositorio.dart';

class Categoria {
  Categoria({this.id, this.descricao});

  Categoria.parseParaCategoria(ParseObject parseObject)
      : id = parseObject.objectId,
        descricao = parseObject.get(CATEGORIADESCCRICAO);

  final String id;
  final String descricao;

  @override
  String toString() {
    return 'Categoria{id: $id, descricao: $descricao}';
  }
}
