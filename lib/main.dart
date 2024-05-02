import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
   
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,ref) {

    //final int selecteColor = ref.watch(selectedColorProvider);
    //final bool isDark = ref.watch(isDarkModeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Widget App',
      routerConfig: appRouter,
      theme: appTheme.theme(),
      //AppTheme(selectedColor: selecteColor, isDarkMode: isDark).theme(),
    );
  }
}
