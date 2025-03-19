import 'package:dartz/dartz.dart';
import '../error/app_exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<BaseException, Type>> call(Params params);
}
