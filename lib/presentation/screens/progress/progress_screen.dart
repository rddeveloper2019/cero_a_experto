import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Controlled Circular Progress Indicator '),
          SizedBox(
            height: 10,
          ),
          _ControlledCircularIndicator(),
        ],
      ),
    );
  }
}

class _ControlledCircularIndicator extends StatelessWidget {
  const _ControlledCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        final double value = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.black45,
                value: value,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(child: LinearProgressIndicator(value: value)),
              SizedBox(
                width: 30,
              ),
              Text(value.toStringAsFixed(2)),
            ],
          ),
        );
      },
      stream: Stream.periodic(Duration(milliseconds: 300), (value) {
        return (value * 2 / 100);
      }).takeWhile((value) => value <= 1),
    );
  }
}
