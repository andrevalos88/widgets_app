import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

void _changeShape(){
  final random = Random();
  width = random.nextInt(300) + 50;
  height = random.nextInt(300) + 50;
  borderRadius = random.nextInt(10) + 2 ;

  color = Color.fromRGBO(
  random.nextInt(255),
  random.nextInt(255),
  random.nextInt(255),
  1
  );

  setState(() {
    
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        _changeShape();
      },
      child:  const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}