import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<int> _favoriteIds = [];
  // getter for FAV
  List<int> get favorite => _favoriteIds;
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds =
        prefs.getStringList("favorite")?.map(int.parse).toList() ?? [];
    emit(FavoriteUpdate(favorites: _favoriteIds));
  }

  Future<void> toggleFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    await prefs.setStringList(
      'favorites',
      _favoriteIds.map((e) => e.toString()).toList(),
    );
    emit(FavoriteUpdate(favorites: _favoriteIds));
  }

  bool isFavorite(int id) => _favoriteIds.contains(id);
}
