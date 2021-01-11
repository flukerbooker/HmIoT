import 'package:flutter/material.dart';

class EnergyManagementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.only(
                top: size.height * 0.03, left: size.width * 0.04),
            child: Text("Energy Management",
                style: Theme.of(context).textTheme.headline4)),
        Container(
          height: size.height * 0.18,
          margin: EdgeInsets.only(
            top: size.height * 0.01,
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]),
        )
      ],
    );
  }
}
