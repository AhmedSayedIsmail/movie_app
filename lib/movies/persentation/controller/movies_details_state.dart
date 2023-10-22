import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/utils/enums.dart';
import 'package:flutter_app/movies/domain/entities/movie_details.dart';
import 'package:flutter_app/movies/domain/entities/recomendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<Recomendation> movieRecomendation;
  final RequestState movieRecomendationState;
  final String movieRecomendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecomendation =const[],
    this.movieRecomendationState = RequestState.loading,
    this.movieRecomendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recomendation>? movieRecomendation,
    RequestState? movieRecomendationState,
    String? movieRecomendationMessage,
  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieRecomendation: movieRecomendation ?? this.movieRecomendation,
        movieRecomendationState:
            movieRecomendationState ?? this.movieRecomendationState,
        movieRecomendationMessage:
            movieRecomendationMessage ?? this.movieRecomendationMessage);
  }

  @override
  List<Object?> get props =>
      [movieDetail, movieDetailsState, movieDetailsMessage];
}
