import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SE_Menu.dart';

class SE_Order extends StatefulWidget {
  const SE_Order({Key? key}) : super(key: key);

  @override
  State<SE_Order> createState() => _SE_OrderState();
}

class _SE_OrderState extends State<SE_Order> {
  final List<League> data = <League>[
    League(
      'Order ID 1',
      <Club>[
        Club(
          'Product 1',
          <Player>[
            Player('Quantity'),
          ],
        ),
        Club(
          'Product 2',
          <Player>[
            Player('Quantity'),
          ],
        ),
        Club(
          'Product 3',
          <Player>[
            Player('Quantity'),
          ],
        ),
      ],
    ),
    League(
      'Order ID 2',
      <Club>[
        Club(
          'Product 1',
          <Player>[
            Player('Quantity'),
          ],
        ),
        Club(
          'Product 2',
          <Player>[
            Player('Quantity'),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            MyExpandableWidget(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class MyExpandableWidget extends StatelessWidget {
  final League league;

  MyExpandableWidget(this.league);

  @override
  Widget build(BuildContext context) {
    if (league.listClubs.isEmpty)
      return ListTile(title: Text(league.leagueName));
    return ExpansionTile(
      key: PageStorageKey<League>(league),
      title: Text(league.leagueName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
      children: league.listClubs
          .map<Widget>((club) => showClubs(club))
          .toList(),
    );
  }
}

showClubs(Club club) {
  return new ExpansionTile(
    key: PageStorageKey<Club>(club),
    title: Text(club.clubName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),),
    children: club.listPlayers.map<Widget>((player) => showPlayers(player)).toList(),
  );
}

showPlayers(Player player) {
  return new ListTile(
    title: new Text(
      player.playerName,
      style: new TextStyle(fontSize: 20),
    ),
  );
}

class League {
  String leagueName;
  List<Club> listClubs;

  League(this.leagueName, this.listClubs);
}

class Club {
  String clubName;
  List<Player> listPlayers;

  Club(this.clubName, this.listPlayers);
}

class Player {
  String playerName;

  Player(this.playerName);
}