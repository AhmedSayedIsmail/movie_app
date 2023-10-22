import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  //use message Because it  is the common in (ServerException and LocalDatabaseException)Two classes
  //there are in exceptions.dart
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}


class ServerFauiler extends Failure {
  const ServerFauiler({required super.message});
}

class DatabaseFauiler extends Failure {
  const DatabaseFauiler({required super.message});
}
