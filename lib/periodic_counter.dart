import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PeriodicCounter extends StatefulWidget {
  const PeriodicCounter({Key? key}) : super(key: key);

  @override
  State<PeriodicCounter> createState() => _PeriodicCounterState();
}

class _PeriodicCounterState extends State<PeriodicCounter> {
  final StreamController<int> streamController = StreamController<int>();
  int counter = 5;

  void startTimer() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;

      streamController.sink.add(counter);

      if (counter >= 20) {
        timer.cancel();
        streamController.close();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            return AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: pow(counter, 2).toDouble(),
                fontWeight: FontWeight.bold,
                color: colorScheme.secondary,
              ),
              duration: const Duration(milliseconds: 250),
              child: Text('$counter'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: startTimer,
        child: const Text('Start Timer'),
      ),
    );
  }
}
