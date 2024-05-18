import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/calculator/calculator_entity.dart';
import 'package:student_lecture_app/domain/calculator/history_entity.dart';

part 'calculator_cubit.freezed.dart';
part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  late TextEditingController leftController;
  late TextEditingController rightController;

  CalculatorCubit() : super(CalculatorState.initial()) {
    leftController = TextEditingController()..addListener(onLeftValueChange);
    rightController = TextEditingController()..addListener(onRightValueChange);
  }

  void onLeftValueChange() {
    inputLeftValue(leftController.text);
  }

  void onRightValueChange() {
    inputRightValue(rightController.text);
  }

  void inputLeftValue(String val) {
    emit(state.unmodified.copyWith.ent(leftValue: val));
  }

  void inputRightValue(String val) {
    emit(state.unmodified.copyWith.ent(rightValue: val));
  }

  void chooseType(CalculatorType type) {
    emit(state.unmodified.copyWith.ent(type: type));
  }

  void submit() {
    state.ent.failureOption.fold(
      () => state.ent.type.when(
        none: () {},
        add: () {
          saveToHistories(state.ent.addMethod);
        },
        subtract: () {
          saveToHistories(state.ent.subtractMethod);
        },
        multiply: () {
          saveToHistories(state.ent.multiplyMethod);
        },
        divide: () {
          saveToHistories(state.ent.divideMethod);
        },
      ),
      (failure) => emit(state.unmodified.copyWith(showError: true)),
    );
  }

  void saveToHistories(double value) {
    emit(state.unmodified.copyWith(isValid: true).copyWith.ent(
          histories: state.ent.newHistory,
          value: value,
        ));
  }

  void restoreHistory(HistoryEntity ent) {
    leftController.removeListener(onLeftValueChange);
    rightController.removeListener(onRightValueChange);

    leftController.value = TextEditingValue(text: ent.leftValue);
    rightController.value = TextEditingValue(text: ent.rightValue);

    leftController.addListener(onLeftValueChange);
    rightController.addListener(onRightValueChange);

    emit(
      state.unmodified.copyWith.ent(
        type: ent.type,
        leftValue: ent.leftValue,
        rightValue: ent.rightValue,
        histories: state.ent.removeHistory(ent),
      ),
    );
  }
}
