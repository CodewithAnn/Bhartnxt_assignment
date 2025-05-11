import 'package:articles_app_assignmment_bharat_nxt/features/article/cubit/article_cubit.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/article/screens/home_screen.dart';
import 'package:articles_app_assignmment_bharat_nxt/features/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArticleCubit()..fetchArticles()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp(
        title: 'Article App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
