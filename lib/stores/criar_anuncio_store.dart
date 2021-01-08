import 'package:mobx/mobx.dart';

part 'criar_anuncio_store.g.dart';

class CriarAnuncioStore = _CriarAnuncioStore with _$CriarAnuncioStore;

abstract class _CriarAnuncioStore with Store {
  _CriarAnuncioStore() {
    print("pagina_store _CriarAnuncioStore()");
  }

  ObservableList imagens = ObservableList();
}
