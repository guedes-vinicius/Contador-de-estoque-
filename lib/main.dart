import 'package:contador_estoque/screens/Add%20Item.dart';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:contador_estoque/data/text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    Get.config(defaultTransition: Transition.cupertino);
    return GetMaterialApp(
      theme: tema.copyWith(
          colorScheme: tema.colorScheme
              .copyWith(primary: Colors.white, secondary: Colors.orange))
      /*ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white, selectionColor: Colors.orange),
          scaffoldBackgroundColor: Color(0xff232c51),
          primaryColor: Colors.white,
          bottomAppBarColor: Color(0xff18203d))*/
      ,
      getPages: [
        GetPage(
          name: '/',
          page: () => ListaDeProdutos(titulo: 'Contador de Estoque'),
        ),
        GetPage(name: '/AddItem', page: () => AddItem())
      ],
      title: 'Contador de Estoque',
      home: ListaDeProdutos(titulo: 'Contador de Estoque', storage: fileTransfer()),
    );
  }
}
