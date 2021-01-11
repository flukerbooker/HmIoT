import 'package:flutter/material.dart';
import 'package:hmiot/screens/account/account.dart';
import 'package:hmiot/screens/home/widgets/usages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Usages(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('HMIoT'),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Account("Account")));
          },
        )
      ],
    );
  }
}
