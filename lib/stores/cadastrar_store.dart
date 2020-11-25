import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extencoes.dart';
import 'package:xlo_mobx/models/usuario.dart';
import 'package:xlo_mobx/repositorios/usuario_repositorio.dart';

part 'cadastrar_store.g.dart';

class CadastrarStore = _CadastrarStore with _$CadastrarStore;

abstract class _CadastrarStore with Store {
  //bom para debugar
  _CadastrarStore() {
    autorun((_) {
      // print(senha);
      // print(senhaConfirmar);
    });
  }

  @observable
  String nome;

  @action
  void setNome(String valor) => nome = valor;

  //monitora caso de algum erro no campo de nome
  @computed
  bool get nomeValido => nome != null && nome.length >= 5;

  String get nomeErro {
    if (nome == null || nomeValido)
      return null;
    else if (nome == null || nome.isEmpty)
      return "Informe este campo";
    else
      return "Nome muito curto";
  }

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
  String telefone;

  @action
  void setTelefone(String valor) => telefone = valor;

  @computed
  bool get telefoneValido => telefone != null && telefone.length >= 14;

  String get telefoneErro {
    if (telefone == null || telefoneValido) {
      return null;
    } else if (telefone.isEmpty) {
      return "Informe este campo";
    } else {
      return "Telefone inválido";
    }
  }

  @observable
  String senha;

  @action
  void setSenha(String valor) => senha = valor;

  @computed
  bool get senhaValida => senha != null && senha.length > 6;

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
  String senhaConfirmar;

  @action
  void setSenhaConfirmar(String valor) => senhaConfirmar = valor;

  @computed
  bool get senhaConfirmarValida => senhaConfirmar != null && senhaConfirmar == senha;

  @computed
  String get senhaConfirmarErro {
    if (senhaConfirmar == null || senhaConfirmarValida) {
      return null;
    } else {
      return "Senha diferente";
    }
  }

  @observable
  String mensagemErro;

  @observable
  bool carregando = false;

  @computed
  bool get formularioValido => nomeValido && emailValido && telefoneValido && senhaValida && senhaConfirmarValida;

  @computed
  Function get cadastrarPrecionado => (formularioValido && !carregando) ? _cadastrar : null;

  @action
  Future<void> _cadastrar() async {
    carregando = true;
    final usuario = Usuario(
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
    );
    try {
      final resultado = await UsuarioRepositorio().cadastrar(usuario);
      print(resultado);
    } catch (e) {
      print("erro doido de mais " + e);
      mensagemErro = e;
    }
    //await Future.delayed(Duration(seconds: 3));
    carregando = false;
  }
}
