import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesChooseCategoryPage extends StatelessWidget {
  const TopStoriesChooseCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'Top Stories',
        ),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHOOSE TYPE',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: Constants.chooseSectionForStories
                  .map((e) => ChipCustom(
                      onTap: () {
                        AutoRouter.of(context).push(TopStoriesRoute(section: e));
                      },
                      title: e))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
