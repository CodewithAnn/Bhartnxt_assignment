part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

class FavoriteUpdate extends FavoritesState {
  final List<int> favorites;

  FavoriteUpdate({required this.favorites});
}
