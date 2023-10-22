import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failure.dart';
import 'package:flutter_app/core/usecase/base_use_case.dart';
import 'package:flutter_app/movies/domain/entities/recomendation.dart';
import 'package:flutter_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendedMoviesUseCase
    extends BaseUseCase<List<Recomendation>, RecomendationParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure,  List<Recomendation>>> call(
          RecomendationParameters parameters) async =>
      await baseMovieRepository.getRecommendationMovies(parameters);
}

//I create this class for pass Mutiparameters to method
class RecomendationParameters extends Equatable {
  final int movieId;

  const RecomendationParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
