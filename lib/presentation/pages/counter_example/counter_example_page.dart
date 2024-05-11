import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/counter_cubit/counter_cubit.dart';
import 'package:student_lecture_app/presentation/pages/counter_example/counter_example_view.dart';

@RoutePage()
class CounterExamplePage extends StatelessWidget {
  const CounterExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const CounterExampleView());
  }
}
