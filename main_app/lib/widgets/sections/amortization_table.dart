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

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 400),
      child: Column(
        children: [
          const Text('Tabla de amortización',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(144, 141, 45, 196))),
          const Divider(),
          Table(
            children: [
              const TableRow(children: [
                TableCell(child: Text('Mes', style: TextStyle(fontWeight: FontWeight.bold))),
                TableCell(child: Text('Pago', style: TextStyle(fontWeight: FontWeight.bold))),
                TableCell(child: Text('Capital', style: TextStyle(fontWeight: FontWeight.bold))),
                TableCell(child: Text('Interés', style: TextStyle(fontWeight: FontWeight.bold))),
                TableCell(child: Text('Balance', style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
              for (var row in _amortizationTable)
                TableRow(children: [
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(row['month'].toString()),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(row['payment']?.toStringAsFixed(2) ?? '0.00'),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(row['principal']?.toStringAsFixed(2) ?? '0.00'),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(row['interest']?.toStringAsFixed(2) ?? '0.00'),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(row['balance']?.toStringAsFixed(2) ?? '0.00'),
                  )),
                ]),
            ],
          )
        ],
      ),
    );
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
