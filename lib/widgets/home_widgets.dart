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
  return TextFormField(
    style: TextStyle(color: Colors.orange),
    controller: controler_cod,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor.trim().length > 1 && valor.trim().length < 13) {
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
  return TextFormField(
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
  return TextFormField(
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
  return TextFormField(
    style: TextStyle(color: Colors.orange),
    readOnly: true,
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
