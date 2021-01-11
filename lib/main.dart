import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/catagoria_repositorio.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/pagina_store.dart';
import 'package:xlo_mobx/stores/usuario_gerenciador_store.dart';

Future<void> main() async {
  print("main main()");
  WidgetsFlutterBinding.ensureInitialized();
  //antes de abrir o app ele tem que iniciar o parse.
  await iniciarParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> iniciarParse() async {
  print("main iniciarParse()");
  await Parse().initialize(
    '0xq3RbEIMesezRh1k93BjekPb2XWkdjDOyzBUJ9f',
    'https://parseapi.back4app.com/',
    clientKey: 'eGvnEtiRILccBxXWsaaojk2DZrGux8zm0wGKXfO8',
    autoSendSessionId: true, //nossa identiuficação sempre estara aberta para não ter que informar cada vez que ue usar
    debug: true, // para mostrar no terminal tudo que está acontecendo no parse.
  );

  //verificar se as categorias estão ok
  final categorias = await CategoriaRepositorio().buscarListaCategorias();
  print("main ....................... ");
  print(categorias);
}

//Com isso aqui eu posso acessar a intancia de PageStore de qualquer local do app.
void setupLocators() {
  print("main setupLocators()");
  //Singleton tem um valor só no app inteiro acessivel de qualquer parte do app
  GetIt.I.registerSingleton(PaginaStore());
  GetIt.I.registerSingleton(UsuarioGerenciadorStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("main build()");
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        // cor de fundo
        appBarTheme: AppBarTheme(
          elevation: 0, // todas telas sem elevação
        ),
        cursorColor: Colors.orange,
      ),
      home: BaseScreen(),
    );
  }
}
