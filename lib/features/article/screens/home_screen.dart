import 'package:articles_app_assignmment_bharat_nxt/features/article/cubit/article_cubit.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/article/widgets/article_card.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/favorites/screens/favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ArticleCubit>().fetchArticles();
    super.initState();
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final articleCubit = context.read<ArticleCubit>();

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        title: Text(
          "Articles",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteScreen(),
                  ),
                ),
            icon: const Icon(Icons.favorite, color: Colors.pink),
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: articleCubit.refreshArticles,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: articleCubit.searchArticles,
                decoration: InputDecoration(
                  hintText: "Search here",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ArticleCubit, ArticleState>(
                builder: (context, state) {
                  debugPrint("State: ${state}");
                  if (state is ArticleLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is ArticleError) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is ArticleFetched) {
                    final articles = state.articles;

                    // show list of cards
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                          child: ArticleCard(article: articles[index]),
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
