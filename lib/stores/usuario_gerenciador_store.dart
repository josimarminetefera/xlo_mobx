import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/usuario.dart';

part 'usuario_gerenciador_store.g.dart';

class UsuarioGerenciadorStore = _UsuarioGerenciadorStore with _$UsuarioGerenciadorStore;

abstract class _UsuarioGerenciadorStore with Store {
  @observable
  Usuario usuario;

  @action
  void setUsuario(Usuario valor) => usuario = valor;

  @computed
  bool get usuarioLogado => usuario != null;
}
