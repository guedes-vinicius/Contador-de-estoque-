import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class Dados extends ChangeNotifier {
  String _codigo = '';

  String get codigo => _codigo;

  Future<void> pegarCodigo() async {
    String codigobar = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
    if (codigobar == '-1') {
      Get.snackbar("erro", 'errado');
    } else {
      _codigo = codigobar;
      notifyListeners();
    }
  }

  void zerarQtd() {
    _codigo = "";
    notifyListeners();
  }
}
