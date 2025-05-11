part of 'article_cubit.dart';

@immutable
sealed class ArticleState {
 
}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticleFetched extends ArticleState {
  final List<ArticleModel> articles;
  final bool isLoading;

  ArticleFetched({required this.articles, this.isLoading = true});
}

final class ArticleError extends ArticleState {
  final String errorMessage;

  ArticleError({required this.errorMessage});
}
