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
  Computed<bool> _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_CadastrarStore.emailValido'))
          .value;
  Computed<bool> _$telefoneValidoComputed;

  @override
  bool get telefoneValido =>
      (_$telefoneValidoComputed ??= Computed<bool>(() => super.telefoneValido,
              name: '_CadastrarStore.telefoneValido'))
          .value;
  Computed<bool> _$senhaValidaComputed;

  @override
  bool get senhaValida =>
      (_$senhaValidaComputed ??= Computed<bool>(() => super.senhaValida,
              name: '_CadastrarStore.senhaValida'))
          .value;
  Computed<bool> _$senhaConfirmarValidaComputed;

  @override
  bool get senhaConfirmarValida => (_$senhaConfirmarValidaComputed ??=
          Computed<bool>(() => super.senhaConfirmarValida,
              name: '_CadastrarStore.senhaConfirmarValida'))
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

  final _$emailAtom = Atom(name: '_CadastrarStore.email');

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

  final _$telefoneAtom = Atom(name: '_CadastrarStore.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$senhaAtom = Atom(name: '_CadastrarStore.senha');

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

  final _$senhaConfirmarAtom = Atom(name: '_CadastrarStore.senhaConfirmar');

  @override
  String get senhaConfirmar {
    _$senhaConfirmarAtom.reportRead();
    return super.senhaConfirmar;
  }

  @override
  set senhaConfirmar(String value) {
    _$senhaConfirmarAtom.reportWrite(value, super.senhaConfirmar, () {
      super.senhaConfirmar = value;
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
  void setEmail(String valor) {
    final _$actionInfo = _$_CadastrarStoreActionController.startAction(
        name: '_CadastrarStore.setEmail');
    try {
      return super.setEmail(valor);
    } finally {
      _$_CadastrarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String valor) {
    final _$actionInfo = _$_CadastrarStoreActionController.startAction(
        name: '_CadastrarStore.setTelefone');
    try {
      return super.setTelefone(valor);
    } finally {
      _$_CadastrarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String valor) {
    final _$actionInfo = _$_CadastrarStoreActionController.startAction(
        name: '_CadastrarStore.setSenha');
    try {
      return super.setSenha(valor);
    } finally {
      _$_CadastrarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaConfirmar(String valor) {
    final _$actionInfo = _$_CadastrarStoreActionController.startAction(
        name: '_CadastrarStore.setSenhaConfirmar');
    try {
      return super.setSenhaConfirmar(valor);
    } finally {
      _$_CadastrarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
telefone: ${telefone},
senha: ${senha},
senhaConfirmar: ${senhaConfirmar},
nomeValido: ${nomeValido},
emailValido: ${emailValido},
telefoneValido: ${telefoneValido},
senhaValida: ${senhaValida},
senhaConfirmarValida: ${senhaConfirmarValida}
    ''';
  }
}
