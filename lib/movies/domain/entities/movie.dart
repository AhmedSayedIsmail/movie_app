import 'package:equatable/equatable.dart';

//I use Equatable Package To Avoid Duplication of Data
//And use this package instead of Make Equatable Manully
class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object?> get props =>
      [id, title, genreIds, overview, voteAverage, releaseDate];

//To Avoid Equitable Data that get from Api(Manual)
//And To Avoid duplication and don't forget Put const near to constractor
/*  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          backdropPath == other.backdropPath &&
          genreIds == other.genreIds &&
          overview == other.overview &&
          voteAverage == other.voteAverage;
//this Symbole BitWith(^)Means XOR
  @override
  int get hashCode =>
  id.hashCode ^
  title.hashCode ^
  backdropPath.hashCode ^
  genreIds.hashCode ^
  overview.hashCode ^
  voteAverage.hashCode ;*/
}
