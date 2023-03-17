import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/providers/providers.dart';

import 'package:qr_scaner/theme/theme.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      elevation: 0,
      currentIndex: currentIndex,
      selectedItemColor: AppTheme.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Coords',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), label: 'Browse History')
      ],
    );
  }
}
