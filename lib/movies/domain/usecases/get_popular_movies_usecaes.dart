import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failure.dart';
import 'package:flutter_app/core/usecase/base_use_case.dart';
import 'package:flutter_app/movies/domain/entities/movie.dart';
import 'package:flutter_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetPopularMoviesUseCase({required this.baseMovieRepository});
  
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
      await baseMovieRepository.getPopulerMovies();
   
}
