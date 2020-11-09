import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //antes de abrir o app ele tem que iniciar o parse.
  await iniciarParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> iniciarParse() async {
  await Parse().initialize(
    '0xq3RbEIMesezRh1k93BjekPb2XWkdjDOyzBUJ9f',
    'https://parseapi.back4app.com/',
    clientKey: 'eGvnEtiRILccBxXWsaaojk2DZrGux8zm0wGKXfO8',
    autoSendSessionId: true, //nossa identiuficação sempre estara aberta para não ter que informar cada vez que ue usar
    debug: true, // para mostrar no terminal tudo que está acontecendo no parse.
  );
}

//Com isso aqui eu posso acessar a intancia de PageStore de qualquer local do app.
void setupLocators() {
  //Singleton tem um valor só no app inteiro
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
