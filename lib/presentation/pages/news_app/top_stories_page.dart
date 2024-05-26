import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesPage extends StatelessWidget {
  final String section;
  const TopStoriesPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: UIHelper.padding(bottom: 10),
                  child: NewsCard(imgSrc: Constants.dummyImg, title: 'dummy data', desc: 'dummy desc'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
