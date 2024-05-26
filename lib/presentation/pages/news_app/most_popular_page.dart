import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MostPopularPage extends StatelessWidget {
  final List<ArticleModel> listArticles;
  const MostPopularPage({super.key, required this.listArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'Most Popular Articles',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            children: listArticles
                .map(
                  (article) => Padding(
                    padding: UIHelper.padding(all: 10),
                    child: NewsCard(
                      imgSrc: article.multimediaConverted,
                      title: article.title,
                      desc: '${article.byline} \u2022 ${article.publishedDateConverted}',
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      )),
    );
  }
}
