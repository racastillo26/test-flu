import 'package:app/res/AppContextExtension.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.resources.strings.menuProducts),
      ),
      body: const Center(
        child: Text('Contenido de la nueva página'),
      ),
    );
  }
}
