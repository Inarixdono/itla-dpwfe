import 'dart:math';

class Loan {
  final double amount;
  final int terms;
  final double interest;

  Loan({
    this.amount = 0.0,
    this.terms = 0,
    this.interest = 0.0,
  });

  double get monthlyInterest => interest / 12 / 100;

  num get monthlyPayment =>
      (amount * monthlyInterest * pow(1 + monthlyInterest, terms)) /
      (pow(1 + monthlyInterest, terms) - 1);
}
