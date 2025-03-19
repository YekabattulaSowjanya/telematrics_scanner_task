class Vehicle {
  Vehicle({
    this.status,
    this.message,
    this.vehicleType,
    this.vehicleCapacity,
    this.vehicleMake,
    this.manufactureYear,
    this.fuelType,
  });

  Vehicle.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['vehicle_type'] != null) {
      vehicleType = [];
      json['vehicle_type'].forEach((v) {
        vehicleType?.add(VehicleType.fromJson(v));
      });
    }
    if (json['vehicle_capacity'] != null) {
      vehicleCapacity = [];
      json['vehicle_capacity'].forEach((v) {
        vehicleCapacity?.add(VehicleCapacity.fromJson(v));
      });
    }
    if (json['vehicle_make'] != null) {
      vehicleMake = [];
      json['vehicle_make'].forEach((v) {
        vehicleMake?.add(VehicleMake.fromJson(v));
      });
    }
    if (json['manufacture_year'] != null) {
      manufactureYear = [];
      json['manufacture_year'].forEach((v) {
        manufactureYear?.add(ManufactureYear.fromJson(v));
      });
    }
    if (json['fuel_type'] != null) {
      fuelType = [];
      json['fuel_type'].forEach((v) {
        fuelType?.add(FuelType.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<VehicleType>? vehicleType;
  List<VehicleCapacity>? vehicleCapacity;
  List<VehicleMake>? vehicleMake;
  List<ManufactureYear>? manufactureYear;
  List<FuelType>? fuelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (vehicleType != null) {
      map['vehicle_type'] = vehicleType?.map((v) => v.toJson()).toList();
    }
    if (vehicleCapacity != null) {
      map['vehicle_capacity'] =
          vehicleCapacity?.map((v) => v.toJson()).toList();
    }
    if (vehicleMake != null) {
      map['vehicle_make'] = vehicleMake?.map((v) => v.toJson()).toList();
    }
    if (manufactureYear != null) {
      map['manufacture_year'] =
          manufactureYear?.map((v) => v.toJson()).toList();
    }
    if (fuelType != null) {
      map['fuel_type'] = fuelType?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FuelType {
  FuelType({
    this.text,
    this.value,
    this.images,
  });

  FuelType.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
    images = json['images'];
  }
  String? text;
  num? value;
  String? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    map['images'] = images;
    return map;
  }
}

class ManufactureYear {
  ManufactureYear({
    this.text,
    this.value,
    this.images,
  });

  ManufactureYear.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
    images = json['images'];
  }
  String? text;
  num? value;
  String? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    map['images'] = images;
    return map;
  }
}

class VehicleMake {
  VehicleMake({
    this.text,
    this.value,
    this.images,
  });

  VehicleMake.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
    images = json['images'];
  }
  String? text;
  num? value;
  String? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    map['images'] = images;
    return map;
  }
}

class VehicleCapacity {
  VehicleCapacity({
    this.text,
    this.value,
    this.images,
  });

  VehicleCapacity.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
    images = json['images'];
  }
  String? text;
  num? value;
  String? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    map['images'] = images;
    return map;
  }
}

class VehicleType {
  VehicleType({
    this.text,
    this.value,
    this.images,
  });

  VehicleType.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
    images = json['images'];
  }
  String? text;
  num? value;
  String? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    map['images'] = images;
    return map;
  }
}
