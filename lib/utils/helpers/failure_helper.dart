import 'package:newsapp/core/errors/exceptions.dart';
import 'package:newsapp/core/errors/failures.dart';

/// Maps an exception to a corresponding failure.
Failure mapExceptionToFailure(Exception exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(exception.message);
  } else if (exception is ServerException) {
    return const ServerFailure();
  } else if (exception is UnauthorizedException) {
    return UnauthorizedFailure(exception.message);
  } else {
    return UnknownFailure(exception);
  }
}

/// Maps a [Failure] object to a human-readable error message.
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      return 'ServerFailure: ${failure.toString()}';
    case const (BadRequestFailure):
      return (failure as BadRequestFailure).message ?? 'Something went wrong.';
    case const (UnknownFailure):
      return 'UnknownFailure: ${failure.toString()}';
    case const (UnauthorizedFailure):
      return (failure as UnauthorizedFailure).message ?? 'Unauthorized';
    default:
      return 'Unexpected Error';
  }
}
