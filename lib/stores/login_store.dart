import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extencoes.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;

  @action
  void setEmail(String valor) => email = valor;

  @computed
  bool get emailValido => email != null && email.emailValido();

  String get emailErro {
    if (email == null || emailValido) {
      return null;
    } else if (email.isEmpty) {
      return "Informe este campo";
    } else {
      return "E-mail inválido";
    }
  }

  @observable
  String senha;

  @action
  void setSenha(String valor) => senha = valor;

  @computed
  bool get senhaValida => senha != null && senha.length >= 4;

  String get senhaErro {
    if (senha == null || senhaValida) {
      return null;
    } else if (senha.isEmpty) {
      return "Informe este campo";
    } else {
      return "Senha inválido";
    }
  }

  @observable
  String mensagemErro;

  @observable
  bool carregando = false;

  //login é valido e senha é valida
  @computed
  Function get loginPrecionado => emailValido && senhaValida && !carregando ? _login : null;

  @action
  Future<void> _login() async {
    carregando = true;

    await Future.delayed(Duration(seconds: 3));

    carregando = false;
  }
}
