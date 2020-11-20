// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrarStore on _CadastrarStore, Store {
  Computed<bool> _$nomeValidoComputed;

  @override
  bool get nomeValido =>
      (_$nomeValidoComputed ??= Computed<bool>(() => super.nomeValido,
              name: '_CadastrarStore.nomeValido'))
          .value;

  final _$nomeAtom = Atom(name: '_CadastrarStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$_CadastrarStoreActionController =
      ActionController(name: '_CadastrarStore');

  @override
  void setNome(String valor) {
    final _$actionInfo = _$_CadastrarStoreActionController.startAction(
        name: '_CadastrarStore.setNome');
    try {
      return super.setNome(valor);
    } finally {
      _$_CadastrarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
nomeValido: ${nomeValido}
    ''';
  }
}
