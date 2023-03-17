import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/utils/utils.dart';

import '../providers/providers.dart';
import '../theme/theme.dart';
import 'widgets.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key, required this.icon, required this.info});
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    final scansProvider = Provider.of<ScanListProvider>(context);
    final scans = scansProvider.scans;
    if (scans.isEmpty) {
      return NoDisplayInfo(
        info: info,
      );
    }
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) =>
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteScansById(scans[index].id!),
          child: ListTile(
            leading: Icon(
              icon,
              color: AppTheme.primary,
            ),
            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppTheme.primary,
            ),
            onTap: () => launchURL(context, scans[index]),
          ),
        );
      },
    );
  }
}
