import 'package:flutter_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_app/movies/data/repository/movies_repository.dart';
import 'package:flutter_app/movies/domain/repository/base_movie_repository.dart';
import 'package:flutter_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_popular_movies_usecaes.dart';
import 'package:flutter_app/movies/domain/usecases/get_recommended_movies_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_app/movies/persentation/controller/movies_bloc.dart';
import 'package:flutter_app/movies/persentation/controller/movies_details_bloc.dart';
import 'package:get_it/get_it.dart';

//Make this global to use this in project
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(
        getNowPlayingMoviesUseCase: sl(),
        getPopularMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl(),));

        
    sl.registerFactory(() => MovieDetailsBloc(getMovieDetailsUseCase: sl(), getRecommendedMoviesUseCase: sl()));

    ///UseCases
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));
    //TopRated
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()));
    //Popular
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMovieRepository: sl()));
    //MovieDetails
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMovieRepository: sl()));
        //GetRecommendedMovies
    sl.registerLazySingleton(
        () => GetRecommendedMoviesUseCase(baseMovieRepository: sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    ///Data Source
    ///To Store object have multiSolutions
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
