import 'package:flutter/material.dart';
import 'package:main_app/widgets/sections/staistics_list.dart';
import 'package:main_app/widgets/sections/best_sellers.dart';
import 'package:main_app/widgets/sections/recent_transactions.dart';
import 'package:main_app/models/mocks.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Dashboard',
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: true),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
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
    );
  }
}