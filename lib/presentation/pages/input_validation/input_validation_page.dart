import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_lecture_app/application/input_validation_cubit/input_validation_cubit.dart';
import 'package:student_lecture_app/core/commons/assets_path.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const PlatformAppBar(
            title: Text(
              'Input Validation',
            ),
          ),
          body: SingleChildScrollView(
            padding: UIHelper.padding(horizontal: 20, vertical: 20),
            child: BlocBuilder<InputValidationCubit, InputValidationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.title,
                      style: context.textTheme.displaySmall?.copyWith(
                        color: ColorConstant.primary,
                      ),
                    ),
                    Text(
                      state.description,
                      style: context.textTheme.displaySmall?.copyWith(
                        color: ColorConstant.darkGrey,
                      ),
                    ),
                    UIHelper.verticalSpace(30),
                    TextFormFieldCustom(
                      controller: context.read<InputValidationCubit>().nameController,
                      hintText: 'Enter your name...',
                      title: 'Name',
                      preffixIcon: SvgPicture.asset(
                        AssetsPath.userIcon,
                        width: UIHelper.setSp(15),
                      ),
                      validator: (_) => state.showNameErrorMesg,
                    ),
                    UIHelper.verticalSpace(20),
                    TextFormFieldCustom(
                      controller: context.read<InputValidationCubit>().emailController,
                      hintText: 'Enter your email...',
                      title: 'Email',
                      preffixIcon: SvgPicture.asset(
                        AssetsPath.emailIcon,
                        width: UIHelper.setSp(15),
                      ),
                      validator: (_) => state.showEmailErrorMesg,
                    )
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: Container(
            padding: UIHelper.padding(horizontal: 10, vertical: 20),
            child: ElevatedButton(
              onPressed: () => context.read<InputValidationCubit>().submit(),
              child: const Text('Submit'),
            ),
          ),
        );
      }),
    );
  }
}
