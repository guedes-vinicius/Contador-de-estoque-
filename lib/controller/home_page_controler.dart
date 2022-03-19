import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  var valorCodigoBarras = '';
  var zerar = '';

  Future<void> escanearCodigoBarras() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.BARCODE);

    if (barcodeScanRes == '-1') {
      Get.snackbar('Cancelado', 'Leitura Cancelada');
      valorCodigoBarras = zerar;
      update();
    } else {
      valorCodigoBarras = barcodeScanRes;
      update();
    }
  }

  void zerarCodigo() {
    valorCodigoBarras = zerar;
    update();
  }
}
