// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaStore on _CategoriaStore, Store {
  final _$erroAtom = Atom(name: '_CategoriaStore.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$_CategoriaStoreActionController =
      ActionController(name: '_CategoriaStore');

  @override
  void alimentarListaCategorias(List<Categoria> categorias) {
    final _$actionInfo = _$_CategoriaStoreActionController.startAction(
        name: '_CategoriaStore.alimentarListaCategorias');
    try {
      return super.alimentarListaCategorias(categorias);
    } finally {
      _$_CategoriaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErro(String valor) {
    final _$actionInfo = _$_CategoriaStoreActionController.startAction(
        name: '_CategoriaStore.setErro');
    try {
      return super.setErro(valor);
    } finally {
      _$_CategoriaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
erro: ${erro}
    ''';
  }
}
