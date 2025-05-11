import 'package:articles_app_assignmment_bharat_nxt/features/article/cubit/article_cubit.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/article/widgets/article_card.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteIds = context.watch<FavoritesCubit>().favorite;
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        title: Text(
          "Favorites",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),

      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleFetched) {
            final favorite =
                state.articles
                    .where((articles) => favoriteIds.contains(articles.id))
                    .toList();

            if (favorite.isEmpty) {
              return const Center(child: Text("No Articles Found Yet"));
            }
            return ListView.builder(
              itemCount: favorite.length,
              itemBuilder: (context, index) {
                return ArticleCard(article: favorite[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
