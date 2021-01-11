import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/categoria.dart';
import 'package:xlo_mobx/repositorios/chave_repositorio.dart';
import 'package:xlo_mobx/repositorios/parse_erros.dart';

class CategoriaRepositorio {
  Future<List<Categoria>> buscarListaCategorias() async {
    print("categoria_repositorio buscarListaCategorias()");
    //..orderByAscending JÁ TRAS AS CATEGORIAS EM ORDEM AUFABETICA
    final queryBuilder = QueryBuilder(ParseObject(CATEGORIA))..orderByAscending(CATEGORIADESCCRICAO);

    final resposta = await queryBuilder.query();

    if (resposta.success) {
      //criar modelos categorias para dentro do app
      //dentro de results tem todas as categorias no formato de parseObject
      print("categoria_repositorio ..................");
      return resposta.results.map((valor) => Categoria.parseParaCategoria(valor)).toList();
    } else {
      throw ParseErros.getDescription(resposta.error.code);
    }
  }
}
