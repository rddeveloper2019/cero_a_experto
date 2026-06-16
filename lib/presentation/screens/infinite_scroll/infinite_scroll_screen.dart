import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController controller = ScrollController();
  final List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;

  Future<void> addFiveImages() async {
    final lastId = imagesIds.lastOrNull ?? 0;
    imagesIds.addAll([lastId + 1, lastId + 2, lastId + 3, lastId + 4, lastId + 5]);
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 2200));

    await addFiveImages();

    setState(() {
      isLoading = false;
    });
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    final random = Random();
    imagesIds.clear();
    imagesIds.addAll([
      random.nextInt(100),
      random.nextInt(100),
      random.nextInt(100),
      random.nextInt(100),
      random.nextInt(100),
    ]);
    setState(() {
      isLoading = false;
    });
  }

  void moveScrollToBottom([double pixels = 300]) {
    if (controller.position.pixels + 150 < controller.position.maxScrollExtent) return;

    controller.animateTo(
      controller.position.pixels + pixels,
      duration: Duration(milliseconds: 230),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (isLoading) return;

      if (controller.position.pixels + 500 > controller.position.maxScrollExtent) {
        loadNextPage();
      }
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
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: controller,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIds[idx]}/500/300.jpg'),
                imageErrorBuilder: (_, _, _) {
                  return const SizedBox(
                    height: 300,
                    child: Center(
                      child: Text('Error', style: TextStyle(color: Colors.white)),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        // 4. ИСПРАВЛЕНИЕ ЛОГИКИ:
        // При загрузке (true) крутим спиннер, в простое (false) показываем стрелку назад.
        child: isLoading
            ? SpinPerfect(infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
