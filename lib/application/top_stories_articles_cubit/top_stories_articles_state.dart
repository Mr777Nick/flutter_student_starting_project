part of 'top_stories_articles_cubit.dart';

@freezed
class TopStoriesArticlesState with _$TopStoriesArticlesState {
  const TopStoriesArticlesState._();
  const factory TopStoriesArticlesState(
      {required Option<Either<AppFailure, List<ArticleModel>>> failureOrSucceedArticles,
      required bool isLoading}) = _TopStoriesArticlesState;

  factory TopStoriesArticlesState.initial() => TopStoriesArticlesState(
        failureOrSucceedArticles: none(),
        isLoading: false,
      );

  TopStoriesArticlesState get unmodified => copyWith(isLoading: false, failureOrSucceedArticles: none());
}
