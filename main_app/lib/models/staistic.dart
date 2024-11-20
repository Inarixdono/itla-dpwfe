class Staistics {
  final int stock;
  final int outOfStock;
  final int pending;

  const Staistics({
    required this.stock,
    required this.outOfStock,
    required this.pending,
  });

  int get total => stock + outOfStock + pending;
}