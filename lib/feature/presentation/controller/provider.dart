import 'package:example/feature/domain/vehicle_usecase/vehicle_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../data/models/Vehicle.dart';

class VehicleProvider extends ChangeNotifier {
  final VehicleUsecase _vehicleUseCases = VehicleUseCasesImp();

  Vehicle? _vehicle;

  Vehicle? get vehicles => _vehicle;
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Text controllers moved to the provider
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _registrationNoController =
      TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController get registrationNoController =>
      _registrationNoController;

  String? _selectedDropdown1;
  String? _selectedDropdown2;
  String? _selectedDropdown3;
  String? _selectedDropdown4;
  String? _selectedDropdown5;
  String? _selectedDropdown6;
  String? _selectedDropdown7;
  String? _otherDropdown;
  int _selectedValue = -1;

  // Getters for dropdowns and controllers
  String? get selectedDropdown1 => _selectedDropdown1;
  String? get selectedDropdown2 => _selectedDropdown2;
  String? get selectedDropdown3 => _selectedDropdown3;
  String? get selectedDropdown4 => _selectedDropdown4;
  String? get selectedDropdown5 => _selectedDropdown5;
  String? get selectedDropdown6 => _selectedDropdown6;
  String? get selectedDropdown7 => _selectedDropdown7;
  String? get otherDropdown => _otherDropdown;
  int get selectedValue => _selectedValue;

  Future<void> vehicleUser() async {
    _isLoading = true;
    notifyListeners();
 var response = await _vehicleUseCases.fetchVehicleOptions(); 
    response.fold((l) {
      debugPrint('Left ${l.message}');

      // _vehicle =[];
      _errorMessage = l.message;
    }, (r) {
      debugPrint('Fetched Meals: ${r.fuelType}');
      _vehicle = r;
      _errorMessage = '';
    });
    _isLoading = false;
    notifyListeners();
  }

  // Setters to update the dropdown values
  void setSelectedDropdown1(String? value) {
    _selectedDropdown1 = value;
    notifyListeners();
  }

  void setSelectedDropdown2(String? value) {
    _selectedDropdown2 = value;
    notifyListeners();
  }

  void setSelectedDropdown3(String? value) {
    _selectedDropdown3 = value;
    notifyListeners();
  }

  void setSelectedDropdown4(String? value) {
    _selectedDropdown4 = value;
    notifyListeners();
  }

  void setSelectedDropdown5(String? value) {
    _selectedDropdown5 = value;
    notifyListeners();
  }

  void setSelectedDropdown6(String? value) {
    _selectedDropdown6 = value;
    notifyListeners();
  }

  void setSelectedDropdown7(String? value) {
    _selectedDropdown7 = value;
    notifyListeners();
  }

  void setOtherDropdown(String? value) {
    _otherDropdown = value;
    notifyListeners();
  }

  void setSelectedValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }

  Barcode? result;
  QRViewController? controller;

  void setController(QRViewController controller) {
    this.controller = controller;
    notifyListeners();
  }

  void setResult(Barcode scanResult) {
    result = scanResult;
    notifyListeners();
  }

  Future<void> toggleFlash() async {
    await controller?.toggleFlash();
    notifyListeners();
  }

  Future<void> flipCamera() async {
    await controller?.flipCamera();
    notifyListeners();
  }

  Future<void> pauseCamera() async {
    await controller?.pauseCamera();
    notifyListeners();
  }

  Future<void> resumeCamera() async {
    await controller?.resumeCamera();
    notifyListeners();
  }
}
