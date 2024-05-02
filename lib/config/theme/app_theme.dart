

import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 84, 27, 176);

const List<Color> colorThemes = [
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
  final bool isDarkMode;

  AppTheme({
     this.selectedColor = 0,
     this.isDarkMode = false
  }): assert(selectedColor >= 0 && selectedColor <= colorThemes.length - 1,
            'Colors must be between 0 and 7') ;

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
    );
  }


  AppTheme copywith ({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}