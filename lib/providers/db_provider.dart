import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scaner/models/scan_model.dart';
export 'package:qr_scaner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
    });
  }

  //INSERT
  Future<int> insertScan(ScanModel scanModel) async {
    final db = await database;
    final res = await db.insert('Scans', scanModel.toJson());
    return res;
  }

  //SELECTS
  Future<ScanModel?> listScansById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> listScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> listScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [type]);

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  //UPDATE
  Future<int> updateScan(ScanModel scanModel) async {
    final db = await database;
    final res = await db.update('Scans', scanModel.toJson(),
        where: 'id = ?', whereArgs: [scanModel.id]);
    return res;
  }

  //DELETE
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
