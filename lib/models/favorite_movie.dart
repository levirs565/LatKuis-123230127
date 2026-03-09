import 'package:flutter/cupertino.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';


final favoriteList = ValueNotifier<List<MovieModel>>([]);

void toggleFavorite(MovieModel movie) {
  final currentValue = favoriteList.value;
  if (currentValue.contains(movie)) {
    favoriteList.value = currentValue.where((item) => item != movie).toList();
  } else {
    favoriteList.value = [...currentValue, movie];
  }
}

bool isFavorite(MovieModel movie) {
  return favoriteList.value.contains(movie);
}