import 'package:mobx/mobx.dart';

part 'cadastrar_store.g.dart';

class CadastrarStore = _CadastrarStore with _$CadastrarStore;

abstract class _CadastrarStore with Store {
  @observable
  String nome;

  @action
  void setNome(String valor) => nome = valor;

  //monitora caso de algum erro no campo de nome
  @computed
  bool get nomeValido => nome != null && nome.length > 6;
  String get nomeErro {
    if (nome == null || nomeValido)
      return null;
    else if (nome == null || nome.isEmpty)
      return "Informe o campo Nome";
    else
      return "Nome muito curto";
  }
}
