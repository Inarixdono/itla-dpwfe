import 'package:flutter/material.dart';
import 'package:main_app/models/transaction.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Transacciones Recientes',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 86, 25, 190)),
        ),
        const Divider(),
        Column(
            children: transactions
                .map((transaction) => TransactionTile(transaction: transaction))
                .toList()),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        transaction.type == 'entrada'
            ? Icons.arrow_upward
            : Icons.arrow_downward,
        color: transaction.type == 'entrada' ? Colors.green : Colors.red,
      ),
      title: Text(transaction.product, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(transaction.quantity),
    );
  }
}
