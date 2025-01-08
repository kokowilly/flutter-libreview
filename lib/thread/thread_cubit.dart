import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadCubit extends Cubit<ThreadState> {
  ThreadCubit(super.initialState);

  parallel() async {
    emit(ThreadState());
    Future.wait<void>([
      _progress1(),
      _progress2(),
      _progress3(),
    ]);
  }

  serial() async {
    emit(ThreadState());
    await _progress1();
    await _progress2();
    await _progress3();
  }

  _progress1() async {
    while (state.progress1 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      emit(state.copyWith(progress1: state.progress1 + 0.01));
    }
  }

  _progress2() async {
    while (state.progress2 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      emit(state.copyWith(progress2: state.progress2 + 0.01));
    }
  }

  _progress3() async {
    while (state.progress3 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      emit(state.copyWith(progress3: state.progress3 + 0.01));
    }
  }
}

class ThreadState {
  final double progress1;
  final double progress2;
  final double progress3;

  ThreadState({
    this.progress1 = 0,
    this.progress2 = 0,
    this.progress3 = 0,
  });

  // Copy method to create a new instance with updated values
  ThreadState copyWith({
    double? progress1,
    double? progress2,
    double? progress3,
  }) {
    return ThreadState(
      progress1: progress1 ?? this.progress1,
      progress2: progress2 ?? this.progress2,
      progress3: progress3 ?? this.progress3,
    );
  }

  @override
  String toString() => 'ThreadState($progress1, $progress2, $progress3)';
}
