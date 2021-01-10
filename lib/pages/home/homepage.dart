import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/pages/account/account.dart';
import 'package:hmiot/pages/setting/setting.dart';
import 'package:hmiot/pages/statistics/statistics.dart';
import 'widgets/body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      drawer: buildDrawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('HMIoT'),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Setting("Setting")));
          },
        )
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Vorapol Charoenkitmongkol'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colorOrangeRed,
              child: Text(
                'V',
                style: TextStyle(color: Colors.white),
              ),
            ),
            accountEmail: Text('win.vorapol52@gmail.com'),
          ),
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Account("Account")));
            },
          ),
          ListTile(
            title: Text('Statistics'),
            leading: Icon(Icons.assessment),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Statistic("Statistic")));
            },
          ),
        ],
      ),
    );
  }
}
