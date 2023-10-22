import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/utils/enums.dart';
import 'package:flutter_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

//This For Populer State
  final List<Movie> populerMovies;
  final RequestState populerState;
  final String populerMessage;

//This For Top Rated State

  final List<Movie> topMovies;
  final RequestState topState;
  final String topMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.populerMovies = const [],
      this.populerState = RequestState.loading,
      this.populerMessage = '',
      this.topMovies = const [],
      this.topState = RequestState.loading,
      this.topMessage = ''});

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? populerMovies,
    RequestState? populerState,
    String? populerMessage,
    List<Movie>? topMovies,
    RequestState? topState,
    String? topMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      populerMovies: populerMovies ?? this.populerMovies,
      populerState: populerState ?? this.populerState,
      populerMessage: populerMessage ?? this.populerMessage,
      topMovies: topMovies ?? this.topMovies,
      topState: topState ?? this.topState,
      topMessage: topMessage ?? this.topMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        populerMovies,
        populerState,
        populerMessage,
        topMovies,
        topState,
        topMessage
      ];
}
