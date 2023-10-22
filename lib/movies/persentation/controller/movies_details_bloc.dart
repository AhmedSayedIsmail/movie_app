import 'dart:async';

import 'package:flutter_app/core/utils/enums.dart';
import 'package:flutter_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_recommended_movies_usecase.dart';
import 'package:flutter_app/movies/persentation/controller/movies_details_event.dart';
import 'package:flutter_app/movies/persentation/controller/movies_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required this.getMovieDetailsUseCase,required this.getRecommendedMoviesUseCase})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendedMovies);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendedMoviesUseCase getRecommendedMoviesUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsMessage: l.message,
              movieDetailsState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendedMovies(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
     final result =
        await getRecommendedMoviesUseCase(RecomendationParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
              movieRecomendationMessage: l.message,
              movieRecomendationState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              movieRecomendation: r,
              movieRecomendationState: RequestState.loaded,
            )));
  } 
}
