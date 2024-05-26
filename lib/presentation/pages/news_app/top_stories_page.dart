import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/top_stories_articles_cubit/top_stories_articles_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesPage extends StatelessWidget {
  final String section;
  final newsRepository = getIt<INewsRepository>();
  TopStoriesPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TopStoriesArticlesCubit>(param1: newsRepository, param2: section)..getTopStories(section),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const PlatformAppBar(
            title: Text(
              'Top Stories',
            ),
          ),
          body: SingleChildScrollView(
            padding: UIHelper.padding(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SECTION:',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: ColorConstant.grey,
                      ),
                    ),
                    Text(
                      section.toUpperCase(),
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: ColorConstant.primary,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(20),
                BlocBuilder<TopStoriesArticlesCubit, TopStoriesArticlesState>(
                  builder: (context, state) {
                    return state.failureOrSucceedArticles.fold(
                      () => state.isLoading
                          ? Center(
                              child: UIHelper.loading(),
                            )
                          : const SizedBox.shrink(),
                      (response) => response.fold(
                        (failure) => failure.when(
                          fromServerSide: (error) => Text(error),
                        ),
                        (articles) => Column(
                          children: [
                            Column(
                              children: List.generate(
                                articles.length.clamp(0, 3),
                                (index) {
                                  final article = articles[index];
                                  return Padding(
                                    padding: UIHelper.padding(bottom: 10),
                                    child: NewsCard(
                                      imgSrc: article.multimediaConverted,
                                      title: article.title,
                                      desc: '${article.byline} \u2022 ${article.publishedDateConverted}',
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
