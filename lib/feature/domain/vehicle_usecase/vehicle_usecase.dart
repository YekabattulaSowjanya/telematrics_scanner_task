import 'package:dartz/dartz.dart';
import '../../../core/error/app_exceptions.dart';
import '../../data/models/Vehicle.dart';
import '../repository/vehicle_repo.dart';


abstract class VehicleUsecase {
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions();
}

class VehicleUseCasesImp extends VehicleUsecase {
  final VehicleRepository vehicleRepository = VehicleRepositoryImpl();

  @override
  Future<Either<BaseException, Vehicle>> fetchVehicleOptions() async {
    // TODO: implement fetchVehicleOptions
    return await vehicleRepository.fetchVehicleOptions();
  }
}
