import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'menu_item.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => _HomeMenuItem(
                title: item.title,
                route: item.route,
                icon: item.icon,
                bgColors: const [Colors.lightBlue, Colors.blue],
              ))
          .toList(),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const _HomeMenuItem({
    required this.title,
    required this.route,
    required this.icon,
    required this.bgColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 50,),
            const SizedBox(height: 10,),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
