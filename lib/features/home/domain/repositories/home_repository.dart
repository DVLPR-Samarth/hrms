import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, Home>> getHome();
}
