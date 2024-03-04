import 'package:flutter/material.dart';

class Category_ {
  final String id;
  final String title;
  final Color color;

  const Category_({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
