import 'dart:math';

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    const List<String> messages = [
      'Калибровка датчиков попкорна...',
      'Анализ дыр в сюжете...',
      'Ретикуляция кинематографических сплайнов...',
      'Загрузка данных с бортового унитаза...',
      'Согласование бюджета CGI...',
      'Полировка красной дорожки...',
      'Споры с режиссёрской версией...',
      'Буферизация четвёртой стены...',
      'Убеждение актёров прийти на съёмку...',
      'Рендеринг сюжетного поворота...',
      'Распутывание спагетти-кода...',
      'Заваривание свежую чашку драмы...',
      'Перезагрузка матрицы...',
    ];

    final milliseconds = Random().nextInt(1200) + 600;

    return Stream.periodic(Duration(milliseconds: milliseconds), (int step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Wait please'),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Wait...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
