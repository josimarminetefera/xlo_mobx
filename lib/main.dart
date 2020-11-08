import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> main() async {
  runApp(MyApp());

  //iniciar parse
  await Parse().initialize(
    '0xq3RbEIMesezRh1k93BjekPb2XWkdjDOyzBUJ9f',
    'https://parseapi.back4app.com/',
    clientKey: 'eGvnEtiRILccBxXWsaaojk2DZrGux8zm0wGKXfO8',
    autoSendSessionId: true, //nossa identiuficação sempre estara aberta para não ter que informar cada vez que ue usar
    debug: true, // para mostrar no terminal tudo que está acontecendo no parse.
  );

  //escrita de dados de teste
  //objetos e dados são divididas em tabelas
  //parse ParseObject é uma linha da tabela
  /*final categoria = ParseObject('Categorias')
    ..set<String>(
      "titulo",
      "Meias",
    )
    ..set<int>(
      "posicao",
      1,
    );
  final resposta = await categoria.save();
  print(resposta.success);*/

  //atualizar um ParseObject
  /*final categoria = ParseObject("Categorias")
    ..objectId = 'J7ghtGPV9u'
    ..set<int>(
      "posicao",
      3,
    );
  final resposta = await categoria.save();
  print(resposta.success);*/

  //deletar um ParseObject
  /*final categoria = ParseObject("Categorias")
  ..objectId = 'J7ghtGPV9u';
  categoria.delete();*/

  //ler os dados de um ParseObject
  /*final resposta = await ParseObject("Categorias").getObject("AKFlQ7fdPO");
  if (resposta.success) print(resposta.result);*/

  //ler todos os objetos
  /*final resposta = await ParseObject("Categorias").getAll();
  if (resposta.success) {
    for (final parseObject in resposta.result) {
      print(parseObject);
    }
  }*/

  //ler todos objetos com características específicas
  final query = QueryBuilder(ParseObject("Categorias"));
  //query.whereEqualTo('posicao', 2);
  query.whereContains("titulo", 'Ca');
  query.whereEqualTo('posicao', 2);
  final resposta = await query.query();
  if (resposta.success) print(resposta.result);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
