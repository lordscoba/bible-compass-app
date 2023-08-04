import 'package:bible_compass_app/data/remote/favoritesrequest.dart';
import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});

final favProviderstatus =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});
