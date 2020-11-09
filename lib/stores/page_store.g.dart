// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageStore on _PageStore, Store {
  final _$paginaAtom = Atom(name: '_PageStore.pagina');

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

  final _$_PageStoreActionController = ActionController(name: '_PageStore');

  @override
  void setPagina(int valor) {
    final _$actionInfo =
        _$_PageStoreActionController.startAction(name: '_PageStore.setPagina');
    try {
      return super.setPagina(valor);
    } finally {
      _$_PageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pagina: ${pagina}
    ''';
  }
}
