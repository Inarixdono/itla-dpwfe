import 'package:flutter/material.dart';
import 'package:main_app/models/loan.dart';

class AmortizationTable extends StatelessWidget {
  AmortizationTable({super.key, required Loan loan})
      : _loan = loan,
        _amortizationTable = generateAmortizationTable(loan);

  final Loan _loan;
  final List<Map<String, num>> _amortizationTable;

  @override
  Widget build(BuildContext context) {
    if (_loan.amount == 0) {
      return const SizedBox();
    }

    return Column(
      children: [
        const Text('Tabla de amortización',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(144, 141, 45, 196))),
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              _buildDataColumn('Mes'),
              _buildDataColumn('Pago'),
              _buildDataColumn('Capital'),
              _buildDataColumn('Interés'),
              _buildDataColumn('Balance'),
            ],
            rows: [
              for (var row in _amortizationTable)
                DataRow(cells: [
                  DataCell(Text(row['month'].toString())),
                  DataCell(
                      Text(row['payment']?.toStringAsFixed(2) ?? '0.00')),
                  DataCell(
                      Text(row['principal']?.toStringAsFixed(2) ?? '0.00')),
                  DataCell(
                      Text(row['interest']?.toStringAsFixed(2) ?? '0.00')),
                  DataCell(
                      Text(row['balance']?.toStringAsFixed(2) ?? '0.00')),
                ]),
            ],
          ),
        )
      ],
    );
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
        label: Expanded(
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}

List<Map<String, num>> generateAmortizationTable(Loan loan) {
  final List<Map<String, num>> amortizationTable = [];
  double balance = loan.amount;

  for (var i = 1; i <= loan.terms; i++) {
    double interest = balance * loan.monthlyInterest;
    double principal = loan.monthlyPayment - interest;
    balance -= principal;

    amortizationTable.add({
      'month': i,
      'payment': loan.monthlyPayment,
      'principal': principal,
      'interest': interest,
      'balance': balance,
    });
  }

  return amortizationTable;
}
