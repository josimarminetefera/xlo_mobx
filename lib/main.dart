import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';

Future<void> main() async {
  //antes de abrir o app ele tem que iniciar o parse.
  await iniciarParse();
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
