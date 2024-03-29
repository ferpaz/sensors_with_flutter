import 'package:flutter/material.dart';

final menuItems = <MenuItem>[
  MenuItem('Giroscopio', Icons.downloading, '/sensors/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed, '/sensors/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/sensors/magnetometer'),
  MenuItem('Giroscopio Ball', Icons.sports_baseball_outlined, '/sensors/gyroscope_ball'),

  MenuItem('Brujula', Icons.explore, '/sensors/compass'),

  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Backgroup Process', Icons.storage_rounded, '/db-pokemons'),

  MenuItem('Biometrics', Icons.fingerprint, '/biometrics'),

  MenuItem('Location', Icons.location_pin, '/location'),
  MenuItem('Map', Icons.map_outlined, '/map'),
  MenuItem('Controlled Map', Icons.gamepad_outlined, '/controlled_map'),

  MenuItem('Badge', Icons.notifications, '/badge'),

  MenuItem('Ad Fullscreen', Icons.ad_units_rounded, '/adfullscreen'),
  MenuItem('Ad Rewarded', Icons.wallet_giftcard_outlined, '/adrewarded'),
];

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}
