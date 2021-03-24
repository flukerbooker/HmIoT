import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/widgets/room_item.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  Future _getAllRoom() async {
    var data = await CallApi().getDataWithoutToken('getDeviceList');
    var jsonData = json.decode(data.body);
    print(jsonData);
    // Room allRoom = Room(
    //   id: jsonData['0'][0]["id"],
    //   name: jsonData['0'][0]["name"],
    //   description: jsonData['0'][0]["name"],
    //   colors: Colors.red,
    //   usage: jsonData['0'][0]["price"],
    // );
    return jsonData['0'];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: _getAllRoom(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data[0]["id"]);
            if (snapshot.data == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.002,
                    horizontal: size.width * 0.01),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return RoomItem(
                      snapshot.data[index]["id"],
                      snapshot.data[index]["name"],
                      snapshot.data[index]["change"],
                      snapshot.data[index]["change"] > 50
                          ? colorOrangeRed
                          : colorGreen,
                      snapshot.data[index]["value"]);
                },
              );
            }
          }),
    );
  }
}
