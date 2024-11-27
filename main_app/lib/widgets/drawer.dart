import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text('Aplicaciones de ejercicios'),
          ),
          ListTile(
            title: const Text('Calculadora de préstamos'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Inventario'),
            onTap: () {
              Navigator.pushNamed(context, '/stock');
            },
          ),
        ],
      ),
    );
  }
}