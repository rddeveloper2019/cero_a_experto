import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<SlideInfo> slides = [
  SlideInfo(
    title: 'A woman and android',
    caption:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'A woman and a bike',
    caption:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",

    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'A woman and a man',
    caption:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",

    imageUrl: 'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController controller = PageController();
  double page = 0;
  bool enriched = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        page = controller.page ?? 0;
        enriched = page >= slides.length - 1 - 0.4;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            children: slides.map((slide) {
              return _Slide(
                title: slide.title,
                caption: slide.caption,
                imageUrl: slide.imageUrl,
              );
            }).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Skip'),
            ),
          ),
          if (enriched)
            Positioned(
              right: 20,
              bottom: 50,
              child: FadeInRight(
                duration: Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Go back'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

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
            Image(
              image: AssetImage(imageUrl),
            ),
            SizedBox(
              height: 20,
            ),
            Text(title, style: titleStyle),
            SizedBox(
              height: 20,
            ),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
