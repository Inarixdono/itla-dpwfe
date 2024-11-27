import 'package:flutter/material.dart';
import 'package:main_app/models/loan.dart';
import 'package:main_app/widgets/my_input.dart';

class LoanForm extends StatelessWidget {
  const LoanForm(
      {super.key,
      required TextEditingController amount,
      required TextEditingController terms,
      required TextEditingController interest,
      required void Function(Loan) setLoan})
      : _amount = amount,
        _terms = terms,
        _interest = interest,
        _setLoan = setLoan;

  final TextEditingController _amount;
  final TextEditingController _terms;
  final TextEditingController _interest;
  final void Function(Loan) _setLoan;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 300.0),
          child: Form(
            child: Column(
              children: [
                MyTextInput(
                    labelText: 'Monto',
                    hintText: 'Ej: 100000',
                    controller: _amount),
                MyTextInput(
                    labelText: 'Cuotas',
                    hintText: 'Ej: 12',
                    controller: _terms),
                MyTextInput(
                  labelText: 'Interés anual',
                  hintText: 'Ej: 30',
                  controller: _interest,
                ),
                ElevatedButton(
                  onPressed: () {
                    final loan = Loan(
                      amount: double.tryParse(_amount.text) ?? 0,
                      terms: int.tryParse(_terms.text) ?? 0,
                      interest: double.tryParse(_interest.text) ?? 0,
                    );

                    _setLoan(loan);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    backgroundColor: const Color.fromARGB(120, 57, 175, 196),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 10),
                if (_amount.text.isNotEmpty ||
                    _terms.text.isNotEmpty ||
                    _interest.text.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      _amount.clear();
                      _terms.clear();
                      _interest.clear();
                      _setLoan(Loan());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      backgroundColor: const Color.fromARGB(120, 255, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Limpiar'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
