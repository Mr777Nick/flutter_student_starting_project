// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart'
    as _i15;
import 'package:student_lecture_app/presentation/pages/calculator_example/calculator_example_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/choose_section_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/counter_example/counter_example_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_step1_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_step2_page.dart'
    as _i5;
import 'package:student_lecture_app/presentation/pages/input_validation/input_validation_page.dart'
    as _i6;
import 'package:student_lecture_app/presentation/pages/news_app/most_popular_page.dart'
    as _i7;
import 'package:student_lecture_app/presentation/pages/news_app/news_app_page.dart'
    as _i8;
import 'package:student_lecture_app/presentation/pages/news_app/top_stories_choose_category_page.dart'
    as _i11;
import 'package:student_lecture_app/presentation/pages/news_app/top_stories_page.dart'
    as _i12;
import 'package:student_lecture_app/presentation/pages/splash_page.dart' as _i9;
import 'package:student_lecture_app/presentation/pages/to_do_app_example/to_do_app_example_page.dart'
    as _i10;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    CalculatorExampleRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalculatorExamplePage(),
      );
    },
    ChooseSectionRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseSectionPage(),
      );
    },
    CounterExampleRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CounterExamplePage(),
      );
    },
    DummyUIStep1Route.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DummyUIStep1Page(),
      );
    },
    DummyUIStep2Route.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DummyUIStep2Page(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InputValidationPage(),
      );
    },
    MostPopularRoute.name: (routeData) {
      final args = routeData.argsAs<MostPopularRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MostPopularPage(
          key: args.key,
          listArticles: args.listArticles,
        ),
      );
    },
    NewsAppRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsAppPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    ToDoAppExampleRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ToDoAppExamplePage(),
      );
    },
    TopStoriesChooseCategoryRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TopStoriesChooseCategoryPage(),
      );
    },
    TopStoriesRoute.name: (routeData) {
      final args = routeData.argsAs<TopStoriesRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.TopStoriesPage(
          key: args.key,
          section: args.section,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CalculatorExamplePage]
class CalculatorExampleRoute extends _i13.PageRouteInfo<void> {
  const CalculatorExampleRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CalculatorExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorExampleRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChooseSectionPage]
class ChooseSectionRoute extends _i13.PageRouteInfo<void> {
  const ChooseSectionRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ChooseSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseSectionRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CounterExamplePage]
class CounterExampleRoute extends _i13.PageRouteInfo<void> {
  const CounterExampleRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CounterExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterExampleRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DummyUIStep1Page]
class DummyUIStep1Route extends _i13.PageRouteInfo<void> {
  const DummyUIStep1Route({List<_i13.PageRouteInfo>? children})
      : super(
          DummyUIStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep1Route';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DummyUIStep2Page]
class DummyUIStep2Route extends _i13.PageRouteInfo<void> {
  const DummyUIStep2Route({List<_i13.PageRouteInfo>? children})
      : super(
          DummyUIStep2Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep2Route';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InputValidationPage]
class InputValidationRoute extends _i13.PageRouteInfo<void> {
  const InputValidationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MostPopularPage]
class MostPopularRoute extends _i13.PageRouteInfo<MostPopularRouteArgs> {
  MostPopularRoute({
    _i14.Key? key,
    required List<_i15.ArticleModel> listArticles,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MostPopularRoute.name,
          args: MostPopularRouteArgs(
            key: key,
            listArticles: listArticles,
          ),
          initialChildren: children,
        );

  static const String name = 'MostPopularRoute';

  static const _i13.PageInfo<MostPopularRouteArgs> page =
      _i13.PageInfo<MostPopularRouteArgs>(name);
}

class MostPopularRouteArgs {
  const MostPopularRouteArgs({
    this.key,
    required this.listArticles,
  });

  final _i14.Key? key;

  final List<_i15.ArticleModel> listArticles;

  @override
  String toString() {
    return 'MostPopularRouteArgs{key: $key, listArticles: $listArticles}';
  }
}

/// generated route for
/// [_i8.NewsAppPage]
class NewsAppRoute extends _i13.PageRouteInfo<void> {
  const NewsAppRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NewsAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsAppRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ToDoAppExamplePage]
class ToDoAppExampleRoute extends _i13.PageRouteInfo<void> {
  const ToDoAppExampleRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ToDoAppExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ToDoAppExampleRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TopStoriesChooseCategoryPage]
class TopStoriesChooseCategoryRoute extends _i13.PageRouteInfo<void> {
  const TopStoriesChooseCategoryRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TopStoriesChooseCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopStoriesChooseCategoryRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TopStoriesPage]
class TopStoriesRoute extends _i13.PageRouteInfo<TopStoriesRouteArgs> {
  TopStoriesRoute({
    _i14.Key? key,
    required String section,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          TopStoriesRoute.name,
          args: TopStoriesRouteArgs(
            key: key,
            section: section,
          ),
          initialChildren: children,
        );

  static const String name = 'TopStoriesRoute';

  static const _i13.PageInfo<TopStoriesRouteArgs> page =
      _i13.PageInfo<TopStoriesRouteArgs>(name);
}

class TopStoriesRouteArgs {
  const TopStoriesRouteArgs({
    this.key,
    required this.section,
  });

  final _i14.Key? key;

  final String section;

  @override
  String toString() {
    return 'TopStoriesRouteArgs{key: $key, section: $section}';
  }
}
