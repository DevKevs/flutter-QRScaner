import 'package:flutter/material.dart';
import 'package:qr_scaner/providers/providers.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String selectedType = 'http';

  Future<ScanModel> insertScan(String valor) async {
    final scanModel = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(scanModel);

    scanModel.id = id;
    if (selectedType == scanModel.tipo) {
      scans.add(scanModel);
      notifyListeners();
    }

    return scanModel;
  }

  loadAllScans() async {
    final dbScans = await DBProvider.db.listScans();
    scans = [...dbScans];
    notifyListeners();
  }

  loadScansByType(String tipo) async {
    final dbScans = await DBProvider.db.listScansByType(tipo);
    scans = [...dbScans];
    selectedType = tipo;
    notifyListeners();
  }

  deleteScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
