import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extencoes.dart';
import 'package:xlo_mobx/repositorios/usuario_repositorio.dart';
import 'package:xlo_mobx/stores/usuario_gerenciador_store.dart';

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
    try {
      final usuario = await UsuarioRepositorio().loginEmail(email, senha);
      //setando no sigleton o usuário quye logou para poder acessar ele de qualquer lugar
      GetIt.I<UsuarioGerenciadorStore>().setUsuario(usuario);
    } catch (e) {
      mensagemErro = e;
    }
    carregando = false;
  }
}
