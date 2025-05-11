import 'package:articles_app_assignmment_bharat_nxt/core/utils/constant.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/article/models/article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  List<ArticleModel> allArticles = [];

  Future<void> fetchArticles() async {
    // To show Loading
    Future.delayed(Duration(seconds: 2));
    emit(ArticleLoading());
    try {
      final response = await Dio().get(apiUrl);
      allArticles =
          (response.data as List)
              .map((json) => ArticleModel.fromJson(json))
              .toList();
      // To show Success

      emit(ArticleFetched(articles: allArticles,));
      // state.isLoading = true;
      
      
    } catch (e, stackTrace) {
      emit(ArticleError(errorMessage: "Failed to load Articles"));
      debugPrint("StackTrace ::: $stackTrace");
    }
  }

  // search the Article
  void searchArticles(String query) {
    if (query.isEmpty) {
      emit(ArticleFetched(articles: allArticles));
    } else {
      final flittered =
          allArticles
              .where(
                (article) =>
                    article.title!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                    article.body!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      emit(ArticleFetched(articles: flittered));
    }
  }

  // pull to refresh
  Future<void> refreshArticles() async {
    await fetchArticles();
  }

  
}
