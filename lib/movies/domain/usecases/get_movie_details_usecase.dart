import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failure.dart';
import 'package:flutter_app/core/usecase/base_use_case.dart';
import 'package:flutter_app/movies/domain/entities/movie_details.dart';
import 'package:flutter_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(MovieParameters parameters) async =>
      await baseMovieRepository.getMovieDetail(parameters);
}

//I create this class for pass Mutiparameters to method
class MovieParameters extends Equatable {
  final int movieId;

  const MovieParameters({required this.movieId});

  @override
  List<Object?> get props => [
    movieId
  ];
}
