import 'package:flutter/material.dart';

class ThreadPage extends StatelessWidget {
  const ThreadPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Thread Demo"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              _ThreadProgressBar(value: 0.1, color: Colors.red[300]),
              _ThreadProgressBar(value: 0.2, color: Colors.green[300]),
              _ThreadProgressBar(value: 0.3, color: Colors.blue[300]),
            ],
          ),
        ),
      );
}

class _ThreadProgressBar extends StatelessWidget {
  final double value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        height: 24.0,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.grey[700],
          color: color,
        ),
      ),
    );
  }

  const _ThreadProgressBar({
    required this.value,
    required this.color,
  });
}
