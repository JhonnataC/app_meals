import 'package:flutter/material.dart';
import 'package:projeto_meals/data/dummy_data.dart';
import 'package:projeto_meals/models/meal.dart';
import 'package:projeto_meals/models/settings.dart';
import 'package:projeto_meals/screens/categories_meals_screen.dart';
import 'package:projeto_meals/screens/meal_details_screen.dart';
import 'package:projeto_meals/screens/settings_screen.dart';
import 'package:projeto_meals/screens/tabs_screen.dart';
import 'package:projeto_meals/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  _onTapFavoriteButton(Meal meal) {
    print('object');
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 23,
          ),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          background: const Color.fromRGBO(255, 254, 229, 1),
          primary: Colors.pink,
          secondary: const Color(0XFFFEC040),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
              titleSmall: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
              bodyLarge: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              bodyMedium: const TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAILS: (context) => MealDetailScreen(
              onTapFavoriteButton: _onTapFavoriteButton,
              isFavorite: _isFavoriteMeal,
            ),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },

      // Ordem de preferencia => routes - onGenerate - onUnknow
      // Usado para criar rotas dinamicamente
      // onGenerateRoute: (settings) {
      //   if (settings.name == 'rota 1') {
      //     return null; tal conteudo
      //   } else if (settings.name) {
      //     return null; tal conteudo
      //   } else {
      //     MaterialPageRoute(
      //       builder: (_) {
      //         return const CategoriesScreen();
      //       },
      //     );
      //   }
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return TabsScreen(
              favoriteMeals: _favoriteMeals,
            );
          },
        );
      },
    );
  }
}
