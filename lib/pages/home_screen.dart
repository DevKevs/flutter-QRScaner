import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_scaner/pages/pages.dart';
import 'package:qr_scaner/providers/providers.dart';
import 'package:qr_scaner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scansProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scansProvider.deleteScans();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const NavigationBarCustom(),
      floatingActionButton: const CustomFloatingButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scansProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scansProvider.loadScansByType('geo');
        return const MapHistoryScreen();
      case 1:
        scansProvider.loadScansByType('http');
        return const BrowseHistoryScreen();
      default:
        return const MapHistoryScreen();
    }
  }
}
