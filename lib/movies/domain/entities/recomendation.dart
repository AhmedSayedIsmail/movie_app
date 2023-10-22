import 'package:equatable/equatable.dart';

class Recomendation extends Equatable {
  final String? backdropPath;
  final int id;

  const Recomendation({this.backdropPath, required this.id});
  @override
  List<Object?> get props => [backdropPath,id];
}
