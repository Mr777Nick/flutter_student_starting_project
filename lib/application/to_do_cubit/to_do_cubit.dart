import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:student_lecture_app/domain/todo/to_do_entity.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entity.dart';

part 'to_do_cubit.freezed.dart';
part 'to_do_state.dart';

class ToDoCubit extends HydratedCubit<ToDoState> {
  late TextEditingController textController;

  ToDoCubit() : super(ToDoState.initial()) {
    textController = TextEditingController()..addListener(onTextChange);
  }

  void onTextChange() {
    inputText(textController.text);
  }

  void inputText(String val) {
    emit(state.copyWith.ent(text: val));
  }

  void changeType(ToDoHistoryType type) {
    emit(state.copyWith.ent(type: type));
  }

  void editToDoText(ToDoHistoryEntity ent) {
    textController.removeListener(onTextChange);
    textController.value = TextEditingValue(text: ent.text);
    textController.addListener(onTextChange);
    emit(state.unmodified.copyWith.ent(
      id: ent.id,
      text: ent.text,
    ));
  }

  void removeToDo(ToDoHistoryEntity ent) {
    emit(
      state.unmodified.copyWith.ent(
        histories: state.ent.removeToDoHistory(ent),
      ),
    );
  }

  void updateToDoStatus({required int id, required bool isDone}) {
    emit(
      state.copyWith.ent(
        histories: state.ent.updateHistories(
          id: id,
          isDone: isDone,
        ),
      ),
    );
  }

  void saveTextToHistories() {
    emit(
      state.unmodified
          .copyWith(showError: false)
          .copyWith
          .ent(histories: state.ent.newHistories, text: textController.text),
    );
  }

  void updateTextToHistories() {
    emit(
      state.unmodified.copyWith(showError: false).copyWith.ent(
            histories: state.ent.updateHistories(
              id: state.ent.id,
              text: state.ent.text,
            ),
          ),
    );
  }

  void submit() {
    state.ent.failureOption.fold(
      () {
        if (state.newToDo) {
          saveTextToHistories();
        } else {
          updateTextToHistories();
        }

        textController.clear();
      },
      (failure) {
        emit(state.copyWith(showError: true));
      },
    );
  }

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState(
      ent: ToDoEntity.fromJson(json),
      showError: false,
    );
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.ent.toJson();
  }
}
