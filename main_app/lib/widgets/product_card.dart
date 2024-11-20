import 'package:flutter/material.dart';
import 'package:main_app/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 75,
        width: 370,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 60,
                  maxHeight: 60,
                ),
                child: Center(child: product.image)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                    Text(product.category),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
