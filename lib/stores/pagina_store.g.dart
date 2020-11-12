// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagina_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaginaStore on _PaginaStore, Store {
  final _$paginaAtom = Atom(name: '_PaginaStore.pagina');

  @override
  int get pagina {
    _$paginaAtom.reportRead();
    return super.pagina;
  }

  @override
  set pagina(int value) {
    _$paginaAtom.reportWrite(value, super.pagina, () {
      super.pagina = value;
    });
  }

  final _$_PaginaStoreActionController = ActionController(name: '_PaginaStore');

  @override
  void setPagina(int valor) {
    final _$actionInfo = _$_PaginaStoreActionController.startAction(
        name: '_PaginaStore.setPagina');
    try {
      return super.setPagina(valor);
    } finally {
      _$_PaginaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pagina: ${pagina}
    ''';
  }
}
