import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contador_estoque/data/itens.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String tabelaNome = 'tabela_produto';
  String colId = 'id';
  String colCodigo = 'CodProd';
  String colNome = 'NomeProd';
  dynamic colCodBar = 'CodBar';
  dynamic colQdtProd = 'QtdProd';

  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }
    return _database;
  }

  Future<Database> inicializaBanco() async {
    Directory diretorio = await getExternalStorageDirectory();
    String path = diretorio.path + 'produtos.db';

    var bancoDeProdutos =
        await openDatabase(path, version: 1, onCreate: _criarBanco);
    return bancoDeProdutos;
  }

  void _criarBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE $tabelaNome('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colCodigo TEXT,'
        '$colNome TEXT,'
        '$colCodBar TEXT,'
        '$colQdtProd TEXT);');
  }

  Future<List<Map<String, dynamic>>> getProdutoMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery("SELECT * FROM tabela_produto");
    return result;
  }

  Future<List<Map<String, dynamic>>> ordenarNome() async {
    Database db = await this.database;
    var result =
        await db.rawQuery('SELECT * FROM tabela_produto ORDER BY NomeProd');
    return result;
  }

  Future<List<Map<String, dynamic>>> ordenarId() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM tabela_produto ORDER BY id');
    return result;
  }

  Future<int> inserirProduto(Itens itens) async {
    Database db = await this.database;
    var result = await db.insert(tabelaNome, itens.toMap());
    return result;
  }

  Future<int> atualizarProduto(Itens itens, int id) async {
    var db = await this.database;
    var result = await db.rawUpdate(
        "UPDATE $tabelaNome SET $colCodigo = '${itens.CodProd}',$colNome = '${itens.NomeProd}',$colCodBar = '${itens.CodBar}', $colQdtProd = '${itens.QtdProd}' WHERE $colId = '$id'");
    return result;
  }

  Future<int> zerarQtd() async {
    var db = await this.database;
    var result = await db.rawUpdate("UPDATE $tabelaNome SET $colQdtProd = 0");
    return result;
  }

  Future<int> apagarProduto(int id) async {
    var db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $tabelaNome WHERE $colId = $id');
    return result;
  }

  Future<List<Itens>> getListaDeProdutos() async {
    var produtoMapList = await getProdutoMapList();
    int count = produtoMapList.length;
    List<Itens> listaDeProdutos = List<Itens>();
    for (int i = 0; i < count; i++) {
      listaDeProdutos.add(Itens.fromMapObject(produtoMapList[i]));
    }
    return listaDeProdutos;
  }
}
