part of '../to_do_app_example_page.dart';

class _ToDoHistoryWidget extends StatelessWidget {
  const _ToDoHistoryWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        if (state.histories.isEmpty) {
          return Text(
            'No history found',
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorConstant.grey,
              fontStyle: FontStyle.italic,
            ),
          );
        }
        return Column(
          children: state.histories
              .map(
                (history) => Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: history.isDone,
                          onChanged: (val) {
                            if (val == null) return;
                            context.read<ToDoCubit>().updateToDoStatus(id: history.id, isDone: val);
                          },
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                history.text,
                              ),
                              if (state.isEdited(history.id)) ...[
                                Row(
                                  children: [
                                    UIHelper.horizontalSpace(5),
                                    Text(
                                      '(edited)',
                                      style: context.textTheme.labelSmall?.copyWith(
                                        color: ColorConstant.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        InkWell(
                          onTap: () {
                            context.read<ToDoCubit>().editToDoText(history);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: ColorConstant.primary,
                          ),
                        ),
                        UIHelper.horizontalSpace(10),
                        InkWell(
                          onTap: () {
                            context.read<ToDoCubit>().removeToDo(history);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: ColorConstant.red,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.divider(),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
