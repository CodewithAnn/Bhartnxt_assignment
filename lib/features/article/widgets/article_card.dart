import 'package:articles_app_assignmment_bharat_nxt/features/article/models/article_model.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/article/screens/details_screen.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    final favCubit = context.watch<FavoritesCubit>();
    final isFav = favCubit.isFavorite(article.id ?? 0);
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(
          article.title ?? "No title Found",
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.body ?? "No Body found",
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: IconButton(
          onPressed: () => favCubit.toggleFavorite(article.id!),
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border_rounded,
            color: Colors.red,
          ),
        ),
        onTap: () {
          // Navigate to Details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(articleModel: article),
            ),
          );
        },
      ),
    );
  }
}
