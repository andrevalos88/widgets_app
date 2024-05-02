import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final bool isDark = ref.watch(themeNotifierProvider).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(onPressed: (){
            //ref.read(isDarkModeProvider.notifier).state = !isDark;
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          }, icon: isDark ? const Icon(Icons.light_mode_outlined ) : const Icon(Icons.dark_mode_outlined ))

        ],
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends ConsumerWidget {
  const _BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    //final int selecteColor = ref.watch(selectedColorProvider);
    final int selecteColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context,index){
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selecteColor, 
          onChanged: (value){
            //ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          }
         );
      }
    );
  }
}