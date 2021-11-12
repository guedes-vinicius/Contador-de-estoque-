import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/data/itens.dart';

class fileTransfer {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/estoque.txt');
  }

  Future<File> writeFile(linha) async {
    final file = await _localFile;
    return file.writeAsString(linha);
  }

//"${ListaPesquisa[i].NomeProd} | ${ListaPesquisa[i].CodBar} | ${ListaPesquisa[i].QtdProd}"
}