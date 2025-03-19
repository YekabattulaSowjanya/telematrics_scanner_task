import 'package:dartz/dartz.dart';
import '../../../core/error/app_exceptions.dart';
import '../../data/datasource/vehicle_remote_datasource.dart';
import '../../data/models/Vehicle.dart';

abstract class VehicleRepository {
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions();
}

class VehicleRepositoryImpl extends VehicleRepository {
  final VehicleRemoteDataSource vehicleRemoteDataSource =
      VehicleRemoteDataSourceImpl();

  @override
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions() async {
    return await vehicleRemoteDataSource.fetchVehicleOptions();
  }
}
