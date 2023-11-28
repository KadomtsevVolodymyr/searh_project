import 'package:flutter/material.dart';
import 'dart:math' as math;

class Client {
  Client(this.color, this.id);

  static final clients = [
    Client(Color(math.Random().nextInt(0xffffffff)), 1),
    Client(Color(math.Random().nextInt(0xffffffff)), 2),
    Client(Color(math.Random().nextInt(0xffffffff)), 3),
  ];
  final Color color;
  final int id;
}
