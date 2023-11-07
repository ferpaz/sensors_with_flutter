import 'package:flutter/material.dart';

final menuItems = <MenuItem>[
  MenuItem('Giroscopio', Icons.downloading, '/sensors/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed, '/sensors/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/sensors/magnetometer'),
  MenuItem('Giroscopio Ball', Icons.sports_baseball_outlined, '/sensors/gyroscope_ball'),
  MenuItem('Brujula', Icons.explore, '/sensors/compass'),
];

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}