library lib_movies;

export 'src/domain/entities/collection_entity.dart';
export 'src/domain/entities/company_entity.dart';
export 'src/domain/entities/country_entity.dart';
export 'src/domain/entities/genre_entity.dart';
export 'src/domain/entities/languages_entity.dart';
export 'src/domain/entities/movie_entity.dart';
export 'src/domain/entities/actor_entity.dart';

export 'src/domain/usecases/get_movie_usecase.dart';
export 'src/domain/usecases/get_movies_popular_usecase.dart';
export 'src/domain/usecases/get_movie_trending_usecase.dart';
export 'src/domain/usecases/get_credits_usecase.dart';

export 'src/domain/repositories/i_movies_repository.dart';
export 'src/data/repositories/movies_repository.dart';

export 'src/data/datasources/i_movies_remote_datasource.dart';
export 'src/data/datasources/movies_dio_datasource.dart';

export 'src/domain/enums/type_search_movies_enum.dart';
