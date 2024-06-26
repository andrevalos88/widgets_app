

import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 84, 27, 176);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];


class AppTheme{
  final int selectedColor;

  AppTheme({
    required this.selectedColor
  }): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and 7') ;

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
    );
  }
}