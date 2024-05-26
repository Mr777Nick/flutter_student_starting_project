import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

part 'top_stories_articles_cubit.freezed.dart';
part 'top_stories_articles_state.dart';

@injectable
class TopStoriesArticlesCubit extends Cubit<TopStoriesArticlesState> {
  final INewsRepository _newsRepository;
  final String section;
  TopStoriesArticlesCubit(@factoryParam this._newsRepository, @factoryParam this.section)
      : super(TopStoriesArticlesState.initial()) {
    getTopStories(section);
  }

  void getTopStories(String section) async {
    emit(state.unmodified.copyWith(isLoading: true));
    final response = await _newsRepository.getTopStories(section);
    emit(
      state.unmodified.copyWith(
        failureOrSucceedArticles: optionOf(response),
      ),
    );
  }
}
