import 'package:flutter/material.dart';
import 'package:main_app/models/loan.dart';
import 'package:main_app/widgets/drawer.dart';
import 'package:main_app/widgets/sections/loan_form.dart';
import 'package:main_app/widgets/sections/loan_summary.dart';
import 'package:main_app/widgets/sections/amortization_table.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({super.key});

  @override
  LoanCalculatorState createState() => LoanCalculatorState();
}

class LoanCalculatorState extends State<LoanCalculator> {
  Loan _loan = Loan();

  final _amount = TextEditingController();
  final _terms = TextEditingController();
  final _interest = TextEditingController();

  void _setLoan(Loan loan) {
    setState(() {
      _loan = loan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de préstamos'),
      ),
      drawer: const MyNavBar(),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 375),
            child: Column(
              children: [
                LoanForm(
                    amount: _amount,
                    terms: _terms,
                    interest: _interest,
                    setLoan: _setLoan),
                const SizedBox(height: 20),
                LoanSummary(loan: _loan),
                const SizedBox(height: 20),
                AmortizationTable(loan: _loan,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
