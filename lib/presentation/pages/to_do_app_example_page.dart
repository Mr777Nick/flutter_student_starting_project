import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class ToDoAppExamplePage extends StatelessWidget {
  const ToDoAppExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'To Do Page',
        ),
      ),
      body: Padding(
        padding: UIHelper.padding(horizontal: 20, vertical: 10),
        child: const Text('edit here'),
      ),
    );
  }
}
