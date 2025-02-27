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
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                spacing: 4.0,
                children: [
                  ElevatedButton(
                    onPressed: () => getCubit(context).functional(),
                    child: Text('Functional'),
                  ),
                  ElevatedButton(
                    onPressed: () => getCubit(context).blocking(),
                    child: Text('Blocking'),
                  ),
                  ElevatedButton(
                    onPressed: () => getCubit(context).imperative(),
                    child: Text('Imperative'),
                  ),
                  ElevatedButton(
                    onPressed: () => getCubit(context).wrongFunctional(),
                    child: Text('Incorrect'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
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
                  Text(state.totalStep == null
                      ? '-'
                      : "Total step: ${state.totalStep}")
                ],
              ),
            ),
          ),
        ),
      );

  ThreadCubit getCubit(BuildContext context) => context.read<ThreadCubit>();
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
