import 'package:flutter/foundation.dart';

enum TypeSearchMovies {
  trending,
  popular,
  topRated,
  genre,
}

extension TypeSearchMoviesExtension on TypeSearchMovies {
  String toShortString() => describeEnum(this);

  bool get isTrending => this == TypeSearchMovies.trending;
  bool get isPopular => this == TypeSearchMovies.popular;
  bool get isTopRated => this == TypeSearchMovies.topRated;
  bool get isGenre => this == TypeSearchMovies.genre;

  bool get isNotTrending => this != TypeSearchMovies.trending;
  bool get isNotPopular => this != TypeSearchMovies.popular;
  bool get isNotTopRated => this != TypeSearchMovies.topRated;
  bool get isNotGenre => this != TypeSearchMovies.genre;
}
