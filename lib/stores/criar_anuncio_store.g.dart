// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criar_anuncio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CriarAnuncioStore on _CriarAnuncioStore, Store {
  final _$categoriaAtom = Atom(name: '_CriarAnuncioStore.categoria');

  @override
  Categoria get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(Categoria value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$_CriarAnuncioStoreActionController =
      ActionController(name: '_CriarAnuncioStore');

  @override
  void setCategoria(Categoria value) {
    final _$actionInfo = _$_CriarAnuncioStoreActionController.startAction(
        name: '_CriarAnuncioStore.setCategoria');
    try {
      return super.setCategoria(value);
    } finally {
      _$_CriarAnuncioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoria: ${categoria}
    ''';
  }
}
