import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'D_Inventory.dart';
import 'D_Order.dart';
import 'D_User.dart';
import 'D_CRUD.dart';

class D_Menu extends StatefulWidget {
  const D_Menu({Key? key}) : super(key: key);

  @override
  _D_MenuState createState() => _D_MenuState();
}

class _D_MenuState extends State<D_Menu> {
  final TabStyle _tabStyle = TabStyle.reactCircle;
  int page = 0;
  final pageOption = [ D_Order(), D_Inventory(), D_CRUD(), D_User()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash merchant ( Distributor )'),
      ),
      body: pageOption[page],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.inventory, title: 'Order'),
          TabItem(icon: Icons.inventory_rounded, title: 'Inventory'),
          TabItem(icon: Icons.update_rounded, title: 'CRUD'),
          TabItem(icon: Icons.people, title: 'User'),
        ],
        initialActiveIndex: page,
        onTap: (int index){
          setState(() {
            page = index;
          });
        },
      ),
    );
  }

// Select style enum from dropdown menu
}
