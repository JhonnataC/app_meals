import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  final void Function(Meal) onTapFavoriteButton;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen({
    Key? key,
    required this.onTapFavoriteButton,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetailScreen> {
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 200,
      width: 320,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.bottomLeft,
                    child: Text(meal.ingredients[index]),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(
                            '#${index + 1}',
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => widget.onTapFavoriteButton(meal),
        child: widget.isFavorite(meal)
            ? const Icon(Icons.star_outlined)
            : const Icon(Icons.star_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
