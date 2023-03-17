import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class BrowseHistoryScreen extends StatelessWidget {
  const BrowseHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListViewCustom(
      icon: Icons.history,
      info: 'historial',
    );
  }
}
