import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/data/itens.dart';
/*
class fileTransfer {

  Future<String> _localPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String documentPath = directory.path;
    String filePath = '$documentPath/estoque.txt';
    return filePath;
  }


  void writeFile(linha) async {
    File file = File(await _localPath());
    file.writeAsString(linha);
  }

//"${ListaPesquisa[i].NomeProd} | ${ListaPesquisa[i].CodBar} | ${ListaPesquisa[i].QtdProd}"
}*/