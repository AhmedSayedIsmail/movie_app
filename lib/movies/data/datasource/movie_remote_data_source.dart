import 'package:dio/dio.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/model/error_message_model.dart';
import 'package:flutter_app/core/utils/constants.dart';
import 'package:flutter_app/movies/data/models/movie_details_model.dart';
import 'package:flutter_app/movies/data/models/movie_model.dart';
import 'package:flutter_app/movies/data/models/recomendation_model.dart';
import 'package:flutter_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_app/movies/domain/usecases/get_recommended_movies_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieParameters parameter);
  Future<List<RecomendationModel>> getRecommendedMovie(RecomendationParameters parameter); 
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(Constants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.formJson(e)));
    } else {
      throw ServerException(
          messageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      Response response = await Dio().get(Constants.populerMoviesPath);
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.formJson(e)));
    } on DioException catch (exception) {
      throw ServerException(
          messageModel: ErrorMessageModel.fromJson(exception.response!.data));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    //Here I Will Call Data From Api
    Response response = await Dio().get(Constants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.formJson(e)));
    } else {
      throw ServerException(
          messageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<MovieDetailsModel> getMovieDetails(MovieParameters parameter) async{
      Response response = await Dio().get(Constants.movieDetailsPath(movieId: parameter.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          messageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<RecomendationModel>> getRecommendedMovie(RecomendationParameters parameter)async {
        Response response = await Dio().get(Constants.movieRecommendationPath(movieId: parameter.movieId));
    if (response.statusCode == 200) {
      return List<RecomendationModel>.from((response.data["results"] as List)
          .map((e) => RecomendationModel.fromJson(e)));
    } else {
      throw ServerException(
          messageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
}
