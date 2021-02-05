import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Room {
  final String id;
  final String name;
  final String description;
  final Color colors;
  final String usage;

  Room(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.colors,
      @required this.usage});
}
