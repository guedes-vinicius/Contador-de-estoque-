import 'package:contador_estoque/controller/model_provider.dart';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    Get.config(defaultTransition: Transition.cupertino);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Dados())],
      child: GetMaterialApp(
        theme: tema.copyWith(
            colorScheme: tema.colorScheme
                .copyWith(primary: Colors.white, secondary: Colors.orange)),
        getPages: [
          GetPage(
            name: '/',
            page: () => ListaDeProdutos(titulo: 'Contador de Estoque'),
          ),
        ],
        title: 'Contador de Estoque',
        home: ListaDeProdutos(titulo: 'Contador de Estoque'),
      ),
    );
  }
}
