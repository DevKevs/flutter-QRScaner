import 'package:flutter/material.dart';
import 'package:qr_scaner/widgets/widgets.dart';

class MapHistoryScreen extends StatelessWidget {
  const MapHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListViewCustom(
      icon: Icons.location_on,
      info: 'coordenadas',
    );
  }
}
