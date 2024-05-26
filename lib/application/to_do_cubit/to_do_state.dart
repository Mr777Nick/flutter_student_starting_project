part of 'to_do_cubit.dart';

@freezed
class ToDoState with _$ToDoState {
  const ToDoState._();

  const factory ToDoState({
    required ToDoEntity ent,
    required bool showError,
  }) = _ToDoState;

  factory ToDoState.initial() => ToDoState(
        ent: ToDoEntity.empty(),
        showError: false,
      );

  ToDoState get unmodified => copyWith(ent: ent.copyWith(id: 0));

  bool isTypeChoosen(ToDoHistoryType type) {
    return ent.type == type;
  }

  bool get newToDo => ent.id == 0;

  bool isEdited(int id) => ent.id == id;

  String? get showTextErrorMsg => showError ? ent.errorMessage : null;

  String get ctaText => newToDo ? 'Save' : 'Update';

  List<ToDoHistoryEntity> get histories => ent.type.when(
        all: () => ent.histories,
        done: () => ent.histories.where((element) => element.isDone).toList(),
        notDone: () => ent.histories.where((element) => !element.isDone).toList(),
      );
}
