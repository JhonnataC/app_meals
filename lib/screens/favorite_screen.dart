import 'package:flutter/material.dart';
import 'package:projeto_meals/components/meal_item.dart';
import 'package:projeto_meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteMeals.isEmpty
          ? const Center(
              child: Text('you don\'t have favorites'),
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (context, index) {
                return MealItem(meal: favoriteMeals[index]);
              },
            ),
    );
  }
}
