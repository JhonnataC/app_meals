import 'package:flutter/material.dart';
import 'package:projeto_meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.grey[600],
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Text(
            'Let\'s cook?',
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        _createItem(
          Icons.restaurant,
          'Meals',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
        ),
        _createItem(
          Icons.settings,
          'Settings',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
        ),
      ],
    );
  }
}
