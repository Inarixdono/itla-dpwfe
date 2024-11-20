import 'package:flutter/material.dart';
import 'package:main_app/models/staistic.dart';
import 'package:main_app/widgets/staistic_card.dart';

class StaisticsList extends StatelessWidget {
  const StaisticsList({super.key, required this.staistics});

  final Staistics staistics;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, spacing: 10, children: [
      StaisticCard(
        title: 'Stock',
        value: staistics.stock.toString(),
        icon: Icons.inventory,
      ),
      StaisticCard(
        title: 'Agotados',
        value: staistics.outOfStock.toString(),
        icon: Icons.event_busy,
      ),
      StaisticCard(
        title: 'Pendientes',
        value: staistics.pending.toString(),
        icon: Icons.pending_actions,
      ),
      StaisticCard(
        title: 'Total',
        value: staistics.total.toString(),
        icon: Icons.pending_actions,
      ),
    ]);
  }
}
