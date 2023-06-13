import 'package:bible_compass_app/data/remote/categoryrequest.dart';
import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider =
    StateNotifierProvider.autoDispose<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier();
});
