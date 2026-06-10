import 'package:flutter/material.dart';

final List<Map<String, dynamic>> cards = [
  {'elevation': 0.0, 'label': 'Elevation 0.0'},
  {'elevation': 1.0, 'label': 'Elevation 1.0'},
  {'elevation': 3.0, 'label': 'Elevation 3.0'},
  {'elevation': 5.0, 'label': 'Elevation 5.0'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (c) => _Card1(
              elevation: c['elevation'],
              label: c['label'],
            ),
          ),
          ...cards.map(
            (c) => _Card2(
              elevation: c['elevation'],
              label: c['label'],
            ),
          ),
          ...cards.map(
            (c) => _Card3(
              elevation: c['elevation'],
              label: c['label'],
            ),
          ),
          ...cards.map(
            (c) => _Card4(
              elevation: c['elevation'],
              label: c['label'],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _Card1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _Card1({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _Card2({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - outlined"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _Card3({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      color: colors.onSurfaceVariant,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - Filled"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _Card4({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.network(
            'https://images.macrumors.com/t/MXHDXNQlNAt8xrNcZB22Efc41hg=/400x0/article-new/2025/06/macos-tahoe.jpg?lossy',
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12)),
                  ),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("$label - image"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
