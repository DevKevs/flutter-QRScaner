import 'package:flutter/material.dart';

class NoDisplayInfo extends StatelessWidget {
  const NoDisplayInfo({super.key, required this.info});
  final info;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 200,
        child: Column(
          children: [
            const Icon(
              Icons.info_outline,
              size: 100,
              color: Colors.red,
            ),
            Text(
              'No hay $info para mostrar!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
