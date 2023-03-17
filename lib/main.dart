import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/pages/pages.dart';
import 'package:qr_scaner/providers/providers.dart';
import 'package:qr_scaner/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UIProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScanListProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanaer',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'map': (context) => const MapScreen()
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
