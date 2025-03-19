import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../error/app_exceptions.dart';


Either<BaseException, http.Response> responseHandler(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return Right(response);
    case 400:
      return Left(BaseException(message: '400 Exception ${response.body}'));
    case 401:
      return Left(BaseException(message: '401 Exception ${response.body}'));
    case 404:
      return Left(BaseException(message: '404 Exception ${response.body}'));
    case 500:
      return Left(BaseException(message: '500 Exception ${response.body}'));
    default:
      return Left(BaseException(message: 'Other Exception ${response.body}'));
  }
}
