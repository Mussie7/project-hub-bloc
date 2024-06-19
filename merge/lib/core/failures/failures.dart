import 'package:equatable/equatable.dart';

/// Represents a failure or error in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify =>
      true; // Allows the failure message to be printed directly

  @override
  String toString() {
    return 'Failure: $message';
  }
}

/// A concrete class representing a server failure.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
