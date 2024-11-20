import 'package:flutter/material.dart';
import 'package:main_app/models/product.dart';
import 'package:main_app/widgets/product_card.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Más vendidos',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 86, 25, 190)),
          ),
        ),
        Column(
          children:
              products.map((product) => ProductCard(product: product)).toList(),
        )
      ],
    );
  }
}