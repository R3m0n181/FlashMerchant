import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'SE_Cart.dart';
import 'SE_Product.dart';
import 'SE_User.dart';


class SE_Menu extends StatefulWidget {

  @override
  _SE_MenuState createState() => _SE_MenuState();
}

class _SE_MenuState extends State<SE_Menu> {
  final TabStyle _tabStyle = TabStyle.reactCircle;
  int page = 1;
  final pageOption = [ SE_Cart(), SE_Product(), SE_User()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash merchant ( Sales Executive )'),
      ),
      body: pageOption[page],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.add_shopping_cart, title: 'cart'),
          TabItem(icon: Icons.home, title: 'home'),
          TabItem(icon: Icons.people, title: 'user'),
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

