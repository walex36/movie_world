import 'package:flutter/foundation.dart';

enum TypeSearchSeries {
  trending,
  popular,
  topRated,
  genre,
}

extension TypeSearchMoviesExtension on TypeSearchSeries {
  String toShortString() => describeEnum(this);

  bool get isTrending => this == TypeSearchSeries.trending;
  bool get isPopular => this == TypeSearchSeries.popular;
  bool get isTopRated => this == TypeSearchSeries.topRated;
  bool get isGenre => this == TypeSearchSeries.genre;

  bool get isNotTrending => this != TypeSearchSeries.trending;
  bool get isNotPopular => this != TypeSearchSeries.popular;
  bool get isNotTopRated => this != TypeSearchSeries.topRated;
  bool get isNotGenre => this != TypeSearchSeries.genre;
}
