import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadCubit extends Cubit<ThreadState> {
  ThreadCubit(super.initialState);

  parallel() async {
    emit(ThreadState());
    Future.wait<int>([
      _progress1(),
      _progress2(),
      _progress3(),
    ]).then(
      (steps) => emit(
        state.copyWith(
          totalStep: steps.reduce((sum, value) => sum + value),
        ),
      ),
    );
  }

  serial() async {
    emit(ThreadState());
    final step1 = await _progress1();
    final step2 = await _progress2();
    final step3 = await _progress3();

    emit(state.copyWith(totalStep: step1 + step2 + step3));
  }

  wrong() async {
    emit(ThreadState());
    var step1 = 0;
    var step2 = 0;
    var step3 = 0;
    _progress1().then((value) => step1 = value);
    _progress2().then((value) => step2 = value);
    _progress3().then((value) => step3 = value);

    emit(state.copyWith(totalStep: step1 + step2 + step3));
  }

  Future<int> _progress1() async {
    var step = 0;
    while (state.progress1 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      step++;
      emit(state.copyWith(progress1: state.progress1 + 0.01));
    }
    return step;
  }

  Future<int> _progress2() async {
    var step = 0;
    while (state.progress2 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      step++;
      emit(state.copyWith(progress2: state.progress2 + 0.01));
    }
    return step;
  }

  Future<int> _progress3() async {
    var step = 0;
    while (state.progress3 <= 1.0) {
      await Future.delayed(Duration(milliseconds: 10));
      step++;
      emit(state.copyWith(progress3: state.progress3 + 0.01));
    }
    return step;
  }
}

class ThreadState {
  final double progress1;
  final double progress2;
  final double progress3;
  final int? totalStep;

  ThreadState({
    this.progress1 = 0,
    this.progress2 = 0,
    this.progress3 = 0,
    this.totalStep = 0,
  });

  // Copy method to create a new instance with updated values
  ThreadState copyWith({
    double? progress1,
    double? progress2,
    double? progress3,
    int? totalStep,
  }) {
    return ThreadState(
        progress1: progress1 ?? this.progress1,
        progress2: progress2 ?? this.progress2,
        progress3: progress3 ?? this.progress3,
        totalStep: totalStep ?? this.totalStep);
  }

  @override
  String toString() => 'ThreadState($progress1, $progress2, $progress3)';
}
