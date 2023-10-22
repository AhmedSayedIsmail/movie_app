import 'package:flutter_app/movies/domain/entities/recomendation.dart';

class RecomendationModel extends Recomendation {
  const RecomendationModel({super.backdropPath, required super.id});

  factory RecomendationModel.fromJson(Map<String, dynamic> json) {
    return RecomendationModel(
        backdropPath: json["backdrop_path"]??"/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg", id: json["id"]);
  }
}
