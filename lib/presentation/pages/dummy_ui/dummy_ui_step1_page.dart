import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_step1_view.dart';

@RoutePage()
class DummyUIStep1Page extends StatelessWidget {
  const DummyUIStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const DummyUIStep1View();
  }
}
