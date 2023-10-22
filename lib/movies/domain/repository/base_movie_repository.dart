import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failure.dart';
import 'package:flutter_app/movies/domain/entities/movie.dart';
import 'package:flutter_app/movies/domain/entities/movie_details.dart';
import 'package:flutter_app/movies/domain/entities/recomendation.dart';
import 'package:flutter_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_recommended_movies_usecase.dart';

abstract class BaseMovieRepository {
  
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  
  Future<Either<Failure, List<Movie>>> getPopulerMovies();

  
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  
  Future<Either<Failure, MovieDetails>> getMovieDetail(MovieParameters parameter);
  
  Future<Either<Failure, List<Recomendation>>> getRecommendationMovies(RecomendationParameters parameters);
}
