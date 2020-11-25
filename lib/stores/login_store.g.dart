// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_LoginStore.emailValido'))
          .value;
  Computed<bool> _$senhaValidaComputed;

  @override
  bool get senhaValida =>
      (_$senhaValidaComputed ??= Computed<bool>(() => super.senhaValida,
              name: '_LoginStore.senhaValida'))
          .value;
  Computed<Function> _$loginPrecionadoComputed;

  @override
  Function get loginPrecionado => (_$loginPrecionadoComputed ??=
          Computed<Function>(() => super.loginPrecionado,
              name: '_LoginStore.loginPrecionado'))
      .value;

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String valor) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(valor);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String valor) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(valor);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
emailValido: ${emailValido},
senhaValida: ${senhaValida},
loginPrecionado: ${loginPrecionado}
    ''';
  }
}
