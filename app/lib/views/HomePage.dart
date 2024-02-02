import 'dart:io';

import 'package:app/res/AppContextExtension.dart';
import 'package:app/views/fragments/CustomersFragment.dart';
import 'package:app/views/fragments/ProductsFragment.dart';
import 'package:app/views/fragments/OrdersFragment.dart';
import 'package:app/views/fragments/SettingsFragment.dart';
import 'package:app/views/pages/CustomerDetailsPage.dart';
import 'package:app/views/pages/OrdersDetailsPage.dart';
import 'package:app/views/pages/ProductsDetailsPage.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return CustomerFragment();
      case 1:
        return ProductsFragment();
      case 2:
        return const OrdersFragment();
      case 3:
        return const SettingsFragment();

      default:
        return const Text("Error");
    }
  }

  _getPageDetails(int pos) {
    switch (pos) {
      case 0:
        return const CustomerDetailsPage();
      case 1:
        return const ProductsDetailsPage();
      case 2:
        return const OrdersDetailsPage();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> drawerItems = [
      DrawerItem(context.resources.strings.menuCustomers, Icons.person),
      DrawerItem(context.resources.strings.menuProducts, Icons.add_box),
      DrawerItem(context.resources.strings.menuOrders, Icons.info),
      DrawerItem(context.resources.strings.menuSettings, Icons.settings)
    ];

    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(drawerItems[_selectedDrawerIndex].title),
        backgroundColor: const Color(0xFF00897b),
        foregroundColor: Colors.white,
        actions: [
          Visibility(
            visible: _selectedDrawerIndex < 3,
            child: IconButton(
              icon: const Icon(Icons.add),
              tooltip: context.resources.strings.add,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          _getPageDetails(_selectedDrawerIndex)),
                );
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Ricardo Castillo"),
              accountEmail: Text("racastillo26@outlook.com"),
              decoration: BoxDecoration(
                color: Color(0xFF00897b),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "RC",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
