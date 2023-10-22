import 'package:flutter_app/movies/data/models/genres_model.dart';
import 'package:flutter_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.image,
      required super.id,
      required super.overview,
      required super.relaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage,
      required super.generes});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          image: json["backdrop_path"],
          id: json["id"],
          overview: json["overview"],
          relaseDate: json["release_date"],
          runTime: json["runtime"],
          title: json["title"],
          voteAverage: json["vote_average"],
          generes:
              List.from(json["genres"].map((e) => GeneresModel.fromJson(e))));
}
