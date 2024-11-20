import 'package:main_app/models/staistic.dart';
import 'package:main_app/models/product.dart';
import 'package:main_app/models/transaction.dart';
import 'package:flutter/material.dart';

const Staistics staistics = Staistics(
  stock: 512,
  outOfStock: 36,
  pending: 457,
);

List<Product> products = [
  Product(
    name: 'Power strip',
    category: 'Electronics',
    image: Image.asset('assets/images/power.webp'),
  ),
  Product(
    name: 'Headset stand',
    category: 'Furniture',
    image: Image.asset('assets/images/stand.jpg'),
  ),
  Product(
    name: 'Logitech G305',
    category: 'Electronics',
    image: Image.asset('assets/images/hub.jpg'),
  ),
  Product(
    name: 'Apple AirPods',
    category: 'Electronics',
    image: Image.asset('assets/images/earpods.webp'),
  ),
  Product(
    name: 'Xbox controller',
    category: 'Video Games',
    image: Image.asset('assets/images/controller.jpg'),
  ),
];

List<Transaction> transactions = [
  Transaction(
    type: "entrada",
    product: "RK ROYAL KLUDGE RK61",
    quantity: "12",
  ),
  Transaction(
    type: "salida",
    product: "Logitech G305",
    quantity: "4",
  ),
  Transaction(
    type: "entrada",
    product: "Apple AirPods",
    quantity: "8",
  ),
];
