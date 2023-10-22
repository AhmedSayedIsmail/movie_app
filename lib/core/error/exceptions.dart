import 'package:flutter_app/core/model/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel messageModel;

  ServerException({required this.messageModel});
}

//this Function used if you use local database like(Sqlflite or Hive)Database
class LocalDatabaseException implements Exception {
  final String message;

  LocalDatabaseException({required this.message});
}
