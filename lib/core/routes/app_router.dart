import 'package:auto_route/auto_route.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: ChooseSectionRoute.page, initial: true),
    AutoRoute(page: DummyUIRoute.page),
    AutoRoute(page: CounterExampleRoute.page),
    AutoRoute(page: InputValidationRoute.page),
    AutoRoute(page: CalculatorExampleRoute.page),
    AutoRoute(page: NewsAppRoute.page),
    AutoRoute(page: ToDoAppExampleRoute.page),
  ];
}
