import 'package:flutter/foundation.dart';
import 'usagesData.dart';

class Room {
  final String id;
  final String name;
  final List<UsagesData> usage;

  Room({@required this.id, @required this.name, @required this.usage});
}
