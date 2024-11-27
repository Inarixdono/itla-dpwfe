import 'package:flutter/material.dart';
import 'package:main_app/widgets/pages/stock.dart';
import 'package:main_app/widgets/pages/loan_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoanCalculator(),
        '/stock': (context) => const StockOverviewPage(),
      }
    );
  }
}


