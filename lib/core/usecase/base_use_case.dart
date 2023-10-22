import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}
//this class will created once in memory
class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
