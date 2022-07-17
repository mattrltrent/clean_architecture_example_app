import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures (usually have 1-1 relationship with exceptions)
class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class InvalidLocationFailure extends Failure {}
