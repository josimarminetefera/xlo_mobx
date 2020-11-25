import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/chave_repositorio.dart';
import 'package:xlo_mobx/repositorios/parse_erros.dart';

import '../models/usuario.dart';

class UsuarioRepositorio {
  Future<Usuario> cadastrar(Usuario usuario) async {
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
    final parseUser = ParseUser(email, senha, null);
    final resposta = await parseUser.login();
    if (resposta.success) {
      return parseUserParaUsuario(resposta.result);
    } else {
      return Future.error(ParseErros.getDescription(resposta.error.code));
    }
  }
}
