import 'package:flutter/material.dart';
import 'package:projeto_meals/components/main_drawer.dart';
import 'package:projeto_meals/models/meal.dart';
import 'package:projeto_meals/screens/categories_screen.dart';
import 'package:projeto_meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectedIndexScreen = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Category list',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      }
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndexScreen]['title'] as String,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const MainDrawer(),
      ),
      body: _screens[_selectedIndexScreen]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            activeIcon: Icon(Icons.star_outlined),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndexScreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
