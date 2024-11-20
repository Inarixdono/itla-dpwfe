import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final Image image;

  const Product({
    required this.name,
    required this.category,
    required this.image,
  });
}