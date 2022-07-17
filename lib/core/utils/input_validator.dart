import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

class InputValidator {
  Either<Failure, String> locationValidChecker(String location) {
    if (location.isEmpty) {
      return Left(InvalidLocationFailure());
    } else {
      return Right(location);
    }
  }
}
