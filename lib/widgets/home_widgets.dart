import 'package:flutter/material.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:get/get.dart';
import 'package:contador_estoque/controller/home_page_controler.dart';

Widget campoNome(controler_nome) {
  return TextFormField(
    style: TextStyle(color: Colors.orange),
    controller: controler_nome,
    keyboardType: TextInputType.text,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty) {
        return "invalido. Insira um nome";
      }
    },
    decoration: InputDecoration(
        hintText: 'Nome',
        labelText: 'Nome do item',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white)),
  );
}

Widget campoCodBar(controler_cod) {
  return new TextFormField(
    style: TextStyle(color: Colors.orange),
    controller: controler_cod,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor == null || valor.isEmpty || valor.trim().length < 13) {
        return 'Invalido. O Codigo de barras precisa ter 13 digitos';
      }
    },
    decoration: InputDecoration(
        hintText: "Código de barras",
        labelText: "Código de barras",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white)),
  );
}

Widget campoQtd(controler_qtd) {
  return new TextFormField(
    style: TextStyle(color: Colors.orange),
    controller: controler_qtd,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty || valor == '0') {
        return 'Invalido. Insira algum valor a partir de 1';
      }
    },
    decoration: InputDecoration(
        hintText: 'Quantidade',
        labelText: 'Quantidade',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white)),
  );
}

Widget campoCodigo(controler_cod) {
  return new TextFormField(
    style: TextStyle(color: Colors.orange),
    controller: controler_cod,
    keyboardType: TextInputType.text,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty) {
        return 'Codigo Invalido';
      }
    },
    decoration: InputDecoration(
        hintText: 'Codigo',
        labelText: 'Codigo do produto',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white)),
  );
}

Widget campoCodBarLeitor(controler) {
  return new TextFormField(
    style: TextStyle(color: Colors.orange),
    readOnly: true,
    //controller: _ccodbar,
    initialValue: Get.find<HomePageController>().valorCodigoBarras,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor == null || valor.isEmpty || valor.trim().length < 13) {
        return 'Invalido. O Codigo de barras precisa ter 13 digitos';
      }
    },
    decoration: InputDecoration(
      hintText: "Código de barras",
      labelText: "Código de barras",
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      border: OutlineInputBorder(),
    ),
  );
}

Widget cancelButtom = TextButton(onPressed: () {}, child: Text("Cancelar"));
Widget confirmButtom = TextButton(onPressed: () {}, child: Text('Confirmar'));

AlertDialog exclusionConfirmation = AlertDialog(
  title: Text('Zerar estoque?'),
  content: Text('Se você confirar, todo o estoque zerá zerado. Tem certeza?'),
);

final Color primaryColor = Color(0xff18203d);
final Color secondaryColor = Color(0xff232c51);
final Color logoGreen = Color(0xff25bcbb);
final Color newcolor = Color(0xFF2661FA);
final Color gradient = Color.fromARGB(255, 255, 136, 34);
