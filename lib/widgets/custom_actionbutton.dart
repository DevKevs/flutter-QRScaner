import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/utils/utils.dart';

import '../providers/providers.dart';

class CustomFloatingButtom extends StatelessWidget {
  const CustomFloatingButtom({super.key});

  scanQRCode(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#3D8BEF', 'Cancelar', false, ScanMode.QR);
    // String barcodeScanRes = 'https://youtube.com';
    // String barcodeScanRes = 'geo:18.49801176441841,-69.80383980066168';

    if (barcodeScanRes == '-1') {
      return;
    }

    final scansProvider = Provider.of<ScanListProvider>(context, listen: false);
    final scan = await scansProvider.insertScan(barcodeScanRes);
    // ignore: use_build_context_synchronously
    launchURL(context, scan);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        await scanQRCode(context);
      },
      child: const Icon(Icons.qr_code_scanner_rounded),
    );
  }
}
