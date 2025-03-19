import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:example/feature/data/models/Vehicle.dart';
import 'package:flutter/material.dart';
import '../../../core/error/app_exceptions.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/response_handler.dart';

abstract class VehicleRemoteDataSource {
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions();
}

class VehicleRemoteDataSourceImpl extends VehicleRemoteDataSource {
  @override
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions() async {
    try {
      debugPrint('Fetching meals from API...');
      var vehicleResponse =
          await AppClient().fetchVehicleOptions(ApiEndPoint.baseURL);
      debugPrint('MealResponse Status Code: ${vehicleResponse.statusCode}');
      debugPrint('MealResponse Body: ${vehicleResponse.body}');

      var response = responseHandler(vehicleResponse);
      debugPrint('Response ${vehicleResponse.body}');
      return response.fold((l) {
        return Left(l);
      }, (r) {
        return Right(Vehicle.fromJson(jsonDecode(r.body)));
      });
    } on Exception catch (e) {
      debugPrint('Login Exception ${e.toString()}');
      return const Left(BaseException(message: 'Exception occurred'));
      // rethrow;
    }
  }
}
