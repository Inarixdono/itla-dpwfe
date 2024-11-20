import 'package:flutter/material.dart';

class StaisticCard extends StatelessWidget {
  const StaisticCard(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 175,
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  child: Icon(icon, color: Theme.of(context).primaryColor,),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 40),
                Text(value),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
