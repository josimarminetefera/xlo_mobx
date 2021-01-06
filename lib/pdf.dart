import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';

import 'package:connectivity/connectivity.dart';
// import 'package:simple_permissions/simple_permissions.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String path;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/evaldo.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<bool> existsFile() async {
    final file = await _localFile;
    return file.exists();
  }

  Future<Uint8List> fetchPost() async {
    print("teste0");

    Map parametros = {"idFatura":"9496141"};
    print("teste1");
    String dados = json.encode(parametros);
    print("teste2");
    final response = await http.post('https://e400daef91f6.ngrok.io/TopcardMobileServer/Boleto/index', body: dados);
    print("teste3");
    print(response.bodyBytes);
    final responseJson = response.bodyBytes;
    print(responseJson);

    return responseJson;
  }

  void loadPdf() async {
    print("--------------------loadPdf");
    await writeCounter(await fetchPost());
    await existsFile();
    path = (await _localFile).path;
    print(path);
    await OpenFile.open(path);


    // SimplePermissions.requestPermission(Permission.WriteExternalStorage);
    // String dir = (await getExternalStorageDirectory()).path + "/download";
    //  String filename = "$dir/" + 'evaldo.pdf';
    // //String filename = 'evaldo.pdf';
    // File f = new File(filename);
    // //f.writeAsBytesSync(stream);
    // print("-------------");
    // await f.writeAsBytes(await fetchPost());
    // print("-------------dddd");
    // print(filename);
    // await launch(filename, forceSafariVC: false, forceWebView: false);

    //await OpenFile.open(path);
    // if (!mounted) return;
    //
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              if (path != null)
                Container(

                )
              else
                Text("Pdf is not Loaded"),
              RaisedButton(
                child: Text("Load pdf"),
                onPressed: loadPdf,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
