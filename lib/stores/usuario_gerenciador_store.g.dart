// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_gerenciador_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioGerenciadorStore on _UsuarioGerenciadorStore, Store {
  Computed<bool> _$usuarioLogadoComputed;

  @override
  bool get usuarioLogado =>
      (_$usuarioLogadoComputed ??= Computed<bool>(() => super.usuarioLogado,
              name: '_UsuarioGerenciadorStore.usuarioLogado'))
          .value;

  final _$usuarioAtom = Atom(name: '_UsuarioGerenciadorStore.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$_UsuarioGerenciadorStoreActionController =
      ActionController(name: '_UsuarioGerenciadorStore');

  @override
  void setUsuario(Usuario valor) {
    final _$actionInfo = _$_UsuarioGerenciadorStoreActionController.startAction(
        name: '_UsuarioGerenciadorStore.setUsuario');
    try {
      return super.setUsuario(valor);
    } finally {
      _$_UsuarioGerenciadorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
usuarioLogado: ${usuarioLogado}
    ''';
  }
}
