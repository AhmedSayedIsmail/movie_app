import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failure.dart';
import 'package:flutter_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_app/movies/data/models/movie_model.dart';
import 'package:flutter_app/movies/domain/entities/movie.dart';
import 'package:flutter_app/movies/domain/entities/movie_details.dart';
import 'package:flutter_app/movies/domain/entities/recomendation.dart';
import 'package:flutter_app/movies/domain/repository/base_movie_repository.dart';
import 'package:flutter_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_recommended_movies_usecase.dart';

class MoviesRepository extends BaseMovieRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    log("getNowPlayingMovies");
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    log(result[0].genreIds.toString());
    return _getdata(result);
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopulerMovies() async {
    log("getPopularMovies");
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    return _getdata(result);
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    log("getTopRatedMovies");
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    return _getdata(result);
  }

  Either<Failure, List<Movie>> _getdata(List<MovieModel> result) {
    try {
      return Right(result);
    } on ServerException catch (ex) {
      return Left(ServerFauiler(message: ex.messageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetail(MovieParameters parameter) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
      try {
      return Right(result);
    } on ServerException catch (ex) {
      return Left(ServerFauiler(message: ex.messageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recomendation>>> getRecommendationMovies(RecomendationParameters parameters) async{
  
   final result = await baseMovieRemoteDataSource.getRecommendedMovie(parameters);
    try {
      return Right(result);
    } on ServerException catch (ex) {
      return Left(ServerFauiler(message: ex.messageModel.statusMessage));
    }
  }
}
