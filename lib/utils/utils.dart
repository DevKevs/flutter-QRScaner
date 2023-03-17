import 'package:flutter/material.dart';
import 'package:qr_scaner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
