import 'package:flutter/material.dart';
import 'package:projeto_meals/components/main_drawer.dart';
import 'package:projeto_meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    super.key,
    required this.onSettingsChanged,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const MainDrawer(),
      ),
      body: Column(
        children: [
          _createSwitch(
            'Gluter Free',
            'only displays gluten-free meals',
            settings.isGlutenFree,
            (value) {
              setState(
                () => settings.isGlutenFree = value,
              );
            },
          ),
          _createSwitch(
            'Lactose Free',
            'only displays lactose-free meals',
            settings.isLactoseFree,
            (value) {
              setState(
                () => settings.isLactoseFree = value,
              );
            },
          ),
          _createSwitch(
            'Vegan',
            'only displays vegan meals',
            settings.isVegan,
            (value) {
              setState(
                () => settings.isVegan = value,
              );
            },
          ),
          _createSwitch(
            'Vegetarian',
            'only displays vegetarian meals',
            settings.isVegetarian,
            (value) {
              setState(
                () => settings.isVegetarian = value,
              );
            },
          ),
        ],
      ),
    );
  }
}
