import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libreview/thread/thread_cubit.dart';

class ThreadPage extends StatelessWidget {
  const ThreadPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ThreadCubit(ThreadState()),
        child: BlocBuilder<ThreadCubit, ThreadState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text("Thread Demo"),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  tooltip: 'Parallel',
                  onPressed: () => context.read<ThreadCubit>().parallel(),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  tooltip: 'Serial',
                  onPressed: () => context.read<ThreadCubit>().serial(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  _ThreadProgressBar(
                    value: state.progress1,
                    color: Colors.red[300],
                  ),
                  _ThreadProgressBar(
                    value: state.progress2,
                    color: Colors.green[300],
                  ),
                  _ThreadProgressBar(
                    value: state.progress3,
                    color: Colors.blue[300],
                  ),
                ],
              ),
            ),
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
