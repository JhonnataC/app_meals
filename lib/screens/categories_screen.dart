import 'package:flutter/material.dart';
import 'package:projeto_meals/components/category_item.dart';
import 'package:projeto_meals/data/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 120,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.5,
        ),
        children: DUMMY_CATEGORIES.map(
          (cat) {
            return CategoryItem(category: cat);
          },
        ).toList(),
      ),
    );
  }
}
