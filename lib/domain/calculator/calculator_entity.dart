import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/calculator/history_entity.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();

  const factory CalculatorEntity({
    required double value,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
    required List<HistoryEntity> histories,
  }) = _CalculatorEntity;

  factory CalculatorEntity.empty() => const CalculatorEntity(
        value: 0,
        leftValue: '',
        rightValue: '',
        type: CalculatorType.none(),
        histories: [],
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftValue)
        .andThen(() => FormValidator.emptyValidator(rightValue))
        .andThen(() => FormValidator.customValidator(validator: _isDivideByZero))
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  Either<String, Unit> get _emptyLeftErrorMsg {
    return FormValidator.emptyValidator(leftValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Left form must not be empty'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _RightErrorMsg {
    return FormValidator.emptyValidator(rightValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Right form must not be empty'),
      ),
      (_) => FormValidator.customValidator(validator: _isDivideByZero).fold(
        (failure) => failure.maybeWhen(
          orElse: () => right(unit),
          costumError: () => left('Cannot be divided by zero'),
        ),
        (_) => right(unit),
      ),
    );
  }

  String? get textErrorMsg {
    return _emptyLeftErrorMsg.andThen(() => _RightErrorMsg).fold(
          (errorMsg) => errorMsg,
          (_) => null,
        );
  }

  String get convertValue {
    RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

    final valueSplitted = value.toString().split('.');

    if (valueSplitted[1].length == 1) {
      return value.toString().replaceAll(regex, '');
    }

    return value.toStringAsFixed(2).replaceAll(regex, '');
  }

  bool get _isDivideByZero {
    return rightValue == '0' && type == const CalculatorType.divide();
  }

  bool get _isAlreadyAddedInHistories {
    final newHistories = [...histories];

    final isFound = newHistories
        .any((element) => element.leftValue == leftValue && element.rightValue == rightValue && element.type == type);

    return isFound;
  }

  List<HistoryEntity> get newHistory {
    final newEnt = HistoryEntity.newEntity(
      leftValue: leftValue,
      rightValue: rightValue,
      type: type,
    );

    if (!_isAlreadyAddedInHistories) {
      return [
        ...histories,
        newEnt,
      ];
    }

    return histories;
  }

  List<HistoryEntity> removeHistory(HistoryEntity ent) {
    final newHistories = [...histories];

    newHistories.removeWhere((element) => element == ent);

    return newHistories;
  }

  double get addMethod {
    return double.parse(leftValue) + double.parse(rightValue);
  }

  double get subtractMethod {
    return double.parse(leftValue) - double.parse(rightValue);
  }

  double get multiplyMethod {
    return double.parse(leftValue) * double.parse(rightValue);
  }

  double get divideMethod {
    return double.parse(leftValue) / double.parse(rightValue);
  }

  double get powMethod {
    return pow(double.parse(leftValue), double.parse(rightValue)).toDouble();
  }
}

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = None;
  const factory CalculatorType.add() = _Add;
  const factory CalculatorType.subtract() = _Subtract;
  const factory CalculatorType.multiply() = _Multiply;
  const factory CalculatorType.divide() = _Divide;
  const factory CalculatorType.pow() = _Pow;
}
