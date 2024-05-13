import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class DummyUIStep1View extends StatelessWidget {
  const DummyUIStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'Dummy UI',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UIHelper.padding(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionText(
                  onTap: () {
                    AutoRouter.of(context).push(const DummyUIStep2Route());
                  },
                  title: 'Next',
                  desc: 'Tab Bar, GridView, ListView',
                  needDivider: false),
              UIHelper.verticalSpace(20),
              Text(
                'Container and Text',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              NewsCard(
                  imgSrc: Constants.dummyImg,
                  title: 'How can I be Flutter Developer Expert?',
                  desc: 'Jill Lepore • 23 May 23'),
              UIHelper.verticalSpace(20),
              Text(
                'Column',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              Column(
                children: List<Widget>.generate(
                  2 * 2 - 1, // 2 is the number of NewsCards, 2 - 1 because we don't want space after the last NewsCard
                  (index) {
                    // Check if the index is even, if it is, return a NewsCard, otherwise return a SizedBox for spacing
                    return index % 2 == 0
                        ? NewsCard(
                            imgSrc: Constants.dummyImg,
                            title: 'How can I be Flutter Developer Expert?',
                            desc: 'Jill Lepore • 23 May 23',
                          )
                        : UIHelper.verticalSpace(10);
                  },
                ),
              ),
              UIHelper.verticalSpace(20),
              Text(
                'Row',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) => RowCard(imgSrc: Constants.dummyImg, title: '$index Image')),
              ),
              UIHelper.verticalSpace(20),
              Text(
                'Button',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                  },
                  child: const Text('Press Me'),
                ),
              ),
              UIHelper.verticalSpace(20),
              Text(
                'Input',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              const TextFormFieldCustom(
                title: 'Email',
                preffixIcon: Icon(Icons.email_outlined),
                hintText: 'Enter your email...',
              ),
              UIHelper.verticalSpace(20),
              Text(
                'Image Asset, Sized Box & Expanded',
                style: context.textTheme.headlineMedium?.copyWith(color: ColorConstant.green),
              ),
              UIHelper.verticalSpace(10),
              Row(children: [
                Expanded(
                  flex: 3,
                  child: RowCard(imgSrc: Constants.dummyImg, title: '1 image'),
                ),
                UIHelper.horizontalSpace(10),
                RowCard(imgSrc: Constants.dummyImg, title: '2 image'),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
