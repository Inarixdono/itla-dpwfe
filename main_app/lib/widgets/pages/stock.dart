import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_app/widgets/drawer.dart';
import 'package:main_app/widgets/sections/staistics_list.dart';
import 'package:main_app/widgets/sections/best_sellers.dart';
import 'package:main_app/widgets/sections/recent_transactions.dart';
import 'package:main_app/models/mocks.dart';

class StockOverviewPage extends StatelessWidget {
  const StockOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 380),
            child: Column(
              children: [
                const StaisticsList(staistics: staistics),
                BestSellers(
                  products: products,
                ),
                RecentTransactions(
                  transactions: transactions,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const MyNavBar(),
    );
  }
}
