abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super('No internet connection. Please check your network.');
}

class MappingFailure extends Failure {
  const MappingFailure() : super('Data mapping failed. Please try again later.');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('An unexpected error occurred. Please try again.');
}
