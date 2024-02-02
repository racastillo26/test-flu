import 'package:app/models/users/Users.dart';
import 'package:app/views/pages/CustomerDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:app/views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DEMO CEL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        CustomerDetailsPage.id: (context) => CustomerDetailsPage(
            ModalRoute.of(context)!.settings.arguments as Users),
      },
    );
  }
}
