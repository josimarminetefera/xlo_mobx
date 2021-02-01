import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/categoria.dart';
import 'package:xlo_mobx/repositorios/catagoria_repositorio.dart';

part 'categoria_store.g.dart';

class CategoriaStore = _CategoriaStore with _$CategoriaStore;

abstract class _CategoriaStore with Store {
  //aqui ficara a lista de categorias puchada lá do repositório
  //metodo construtor
  _CategoriaStore() {
    _carregarCategorias();
  }

  ObservableList<Categoria> listaCategorias = ObservableList<Categoria>();

  @computed
  //trazer a lista de categorias mais uma extra de todas
  List<Categoria> get listaCategoriasCompleta => List.from(listaCategorias)..insert(0, Categoria(id: "*", descricao: "Todas"));

  Future<void> _carregarCategorias() async {
    try {
      //lista de categorias
      final categorias = await CategoriaRepositorio().buscarListaCategorias();
      //setar a lista de categorias aqui dentro do store
      alimentarListaCategorias(categorias);
    } catch (erro) {
      setErro(erro);
    }
  }

  //action porque eu preciso alterar o valor da lista de categorias
  @action
  void alimentarListaCategorias(List<Categoria> categorias) {
    listaCategorias.clear();
    //adiciona todas as categorias do banco dentro do aplicativo
    listaCategorias.addAll(categorias);
  }

  //se der algum erro no local onde estiver observando o erro ele recebe a notificação
  @observable
  String erro;

  @action
  void setErro(String valor) => erro = valor;
}
