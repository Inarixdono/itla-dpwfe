import 'package:flutter/material.dart';
import 'package:main_app/models/loan.dart';

class LoanSummary extends StatelessWidget {
  const LoanSummary({super.key, required Loan loan}) : _loan = loan;

  final Loan _loan;

  @override
  Widget build(BuildContext context) {
    if (_loan.amount == 0) {
      return const SizedBox();
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 300.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Resultado:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              const Text('La cuota mensual es:'),
              Text(
                _loan.monthlyPayment.toStringAsFixed(2),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                  'Considerando un monto de \$${_loan.amount.toStringAsFixed(2)} a una tasa de interés de ${_loan.interest.toStringAsFixed(2)}% en un plazo de ${_loan.terms} meses.'),
            ],
          ),
        ),
      ),
    );
  }
}
