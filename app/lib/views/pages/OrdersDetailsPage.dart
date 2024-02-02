import 'package:app/res/AppContextExtension.dart';
import 'package:flutter/material.dart';

class OrdersDetailsPage extends StatelessWidget {
  const OrdersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.resources.strings.menuOrders),
        backgroundColor: const Color(0xFF00897b),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Contenido de la nueva página'),
      ),
    );
  }
}
