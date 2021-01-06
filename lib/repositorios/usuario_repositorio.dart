import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/chave_repositorio.dart';
import 'package:xlo_mobx/repositorios/parse_erros.dart';

import '../models/usuario.dart';

class UsuarioRepositorio {
  Future<Usuario> cadastrar(Usuario usuario) async {
    print("usuario_repositorio cadastrar()");
    final parseUser = ParseUser(
      usuario.email,
      usuario.senha,
      usuario.email,
    );

    parseUser.set<String>(USUARIONOME, usuario.nome);
    parseUser.set<String>(USUARIOTELEFONE, usuario.telefone);
    parseUser.set(USUARIOTIPO, usuario.tipo.index);

    //criar um usuário no parse server
    final resposta = await parseUser.signUp();
    if (resposta.success) {
      return parseUserParaUsuario(resposta.result);
    } else {
      //pegar o codigo transformar em um texto e voltei como futuro
      return Future.error(ParseErros.getDescription(resposta.error.code));
    }
  }

  //ler todos parametros do parse e mandar para o usuario
  Usuario parseUserParaUsuario(ParseUser parseUser) {
    print("usuario_repositorio parseUserParaUsuario()");
    return Usuario(
      id: parseUser.objectId,
      nome: parseUser.get(USUARIONOME),
      email: parseUser.get(USUARIOEMAIL),
      telefone: parseUser.get(USUARIOTELEFONE),
      tipo: TipoUsuario.values[parseUser.get(USUARIOTIPO)],
      dataCriacao: parseUser.get(USUARIODATACRIACAO),
    );
  }

  Future<Usuario> loginEmail(String email, String senha) async {
    print("usuario_repositorio loginEmail()");
    final parseUser = ParseUser(email, senha, null);
    final resposta = await parseUser.login();
    if (resposta.success) {
      return parseUserParaUsuario(resposta.result);
    } else {
      return Future.error(ParseErros.getDescription(resposta.error.code));
    }
  }

  Future<Usuario> pegarUsuarioLogado() async {
    print("usuario_repositorio pegarUsuarioLogado()");
    //ultimo usuário logado no app
    final ultimoUsuarioLogado = await ParseUser.currentUser();
    print("usuario_repositorio "+ultimoUsuarioLogado.toString());
    if (ultimoUsuarioLogado != null) {
      print("usuario_repositorio tem usuario");
      print(ultimoUsuarioLogado);
      final resposta = await ParseUser.getCurrentUserFromServer(ultimoUsuarioLogado.sessionToken);
      if (resposta.success) {
        print("usuario_repositorio tem usuário logado com sucesso");
        //usuário ainda é valido
        return parseUserParaUsuario(resposta.result);
      } else {
        //não é mais valido
        await ultimoUsuarioLogado.logout();
      }
    }
    return null;
  }
}
