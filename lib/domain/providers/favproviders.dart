import 'package:bible_compass_app/data/remote/favoritesrequest.dart';
import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favProvider =
    StateNotifierProvider.autoDispose<FavoriteNotifier, FavoriteState>((ref) {
  ref.keepAlive();
  return FavoriteNotifier();
});

final favProviderstatus =
    StateNotifierProvider.autoDispose<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});
