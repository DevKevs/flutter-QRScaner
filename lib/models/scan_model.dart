// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  int? id;
  String? tipo;
  String valor;

  LatLng getLatLgn() {
    final latLgn = valor.substring(4).split(',');

    final lat = double.parse(latLgn[0]);
    final lgn = double.parse(latLgn[1]);

    return LatLng(lat, lgn);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

  @override
  String toString() {
    return 'Id: $id, Tipo: $tipo, Valor: $valor \n';
  }
}
