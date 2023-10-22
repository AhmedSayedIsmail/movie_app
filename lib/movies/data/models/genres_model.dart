import 'package:flutter_app/movies/domain/entities/genres.dart';

class GeneresModel extends Genres {
  const GeneresModel({required super.id, required super.name});

  factory GeneresModel.fromJson(Map<String, dynamic> json) =>
      GeneresModel(id: json["id"], name: json["name"]);
}
