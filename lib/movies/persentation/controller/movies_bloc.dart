import 'dart:async';

import 'package:flutter_app/core/usecase/base_use_case.dart';
import 'package:flutter_app/core/utils/enums.dart';
import 'package:flutter_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_popular_movies_usecaes.dart';
import 'package:flutter_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_app/movies/persentation/controller/movies_event.dart';
import 'package:flutter_app/movies/persentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  //this is Constructor
  //super call parent bloc and give bloc InitialState MoviesState
  MoviesBloc(
      {required this.getNowPlayingMoviesUseCase,
      required this.getPopularMoviesUseCase,
      required this.getTopRatedMoviesUseCase})
      : super(const MoviesState()) {
    //here i want to call events
    ///this NewPlayingMovies Event
    on<GetNewPlayingMoviesEvent>(_getNewPlayingMovies);

    ///This is Populer Event
    on<GetPopularMoviesEvent>(_getPopularMovies);

    ///This is TopRated Event
    on<GetTopRatedMoviesEvent>(_getTopratedMovies);
  }

  FutureOr<void> _getNewPlayingMovies(
      GetNewPlayingMoviesEvent event, Emitter<MoviesState> emit) async {

   final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            populerState: RequestState.error, populerMessage: l.message)),
        (r) => emit(state.copyWith(
            populerState: RequestState.loaded, populerMovies: r)));
  }

  FutureOr<void> _getTopratedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
  
    final result = await getTopRatedMoviesUseCase(const NoParameters());

      result.fold(
          (l) => emit(state.copyWith(
              topState: RequestState.error, topMessage: l.message)),
          (r) => emit(state.copyWith(
              topState: RequestState.loaded, topMovies: r)));
    }
}