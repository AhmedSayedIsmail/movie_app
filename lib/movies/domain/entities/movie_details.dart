import 'package:equatable/equatable.dart';
import 'package:flutter_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String image;
  final int id;
  final String overview;
  final String relaseDate;
  final int runTime;
  final String title;
  final num voteAverage;
  final List<Genres> generes;

  const MovieDetails(
      {required this.image,
      required this.id,
      required this.overview,
      required this.relaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage,
      required this.generes
      
      });
  @override
  List<Object?> get props =>
      [image, id, overview, relaseDate, runTime, title, voteAverage,generes];
}
