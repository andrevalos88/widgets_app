import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title,this.caption,this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo('Busca la comida', 'Ipsum et pariatur do occaecat. Ullamco commodo non fugiat ex reprehenderit do commodo quis aliquip. ', 'assets/images/1.png'),
  SlidesInfo('Entrega rapida', 'Cupidatat veniam eu ullamco dolore quis consequat cillum ex ex et cupidatat occaecat laborum.', 'assets/images/2.png'),
  SlidesInfo('Disfruta de la comida', 'Nostrud officia duis cillum exercitation irure voluptate irure duis.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewcontroller = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewcontroller.addListener(() {
      final page = pageViewcontroller.page ?? 0;
      if( !endReached && page >= (slides.length-1.5)){
        setState(() {
          endReached = true;
        });
      }


    });

  }


  @override
  void dispose() {
    pageViewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewcontroller,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl)).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip>>'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ?
          Positioned(
            right: 20,
            bottom: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                  onPressed: () => context.pop(), 
                  child: const Text('Comenzar')
                ),
            )
          ) : 
          const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({super.key, 
  required this.title, 
  required this.caption, 
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}