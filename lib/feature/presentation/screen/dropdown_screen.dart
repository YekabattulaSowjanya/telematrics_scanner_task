import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/constant_titles.dart';
import '../../../core/custom/custom_dropdown.dart';
import '../controller/provider.dart';

class DropdownScreen extends StatelessWidget {
  const DropdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
        builder: (context, vehicleProvider, child) {
      if (vehicleProvider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (vehicleProvider.errorMessage.isNotEmpty) {
        return Center(child: Text('Error: ${vehicleProvider.errorMessage}'));
      } else if (vehicleProvider.vehicles != null) {
        final vehicle = vehicleProvider.vehicles;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constants.vehicleType,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Vehicle Type
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Track',
                value: vehicleProvider.selectedDropdown1,
                items:
                    (vehicle?.vehicleType ?? []).map((e) => e.text!).toList(),
                onChanged: (newValue) {
                  vehicleProvider.setSelectedDropdown1(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle type';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.make,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Vehicle Make
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Select Vehicle Make',
                value: vehicleProvider.selectedDropdown2,
                items: (vehicle?.vehicleMake ?? [])
                    .map((e) => e.text!)
                    .toSet()
                    .toList(),
                // Use Set to ensure uniqueness
                onChanged: (newValue) {
                  vehicleProvider.setSelectedDropdown2(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle Make';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.model,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Vehicle Make
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Select Vehicle Model',
                value: vehicleProvider.selectedDropdown6,
                items: ["opyio", "kjj", "hghgh"],
                // Use Set to ensure uniqueness
                onChanged: (newValue) {
                  //vehicleProvider.setSelectedDropdown6(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle Model';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.variance,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Vehicle variation
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Select Vehicle variation',
                value: vehicleProvider.selectedDropdown7,
                items: ["iii", "hhhh", "hhh"],
                // Use Set to ensure uniqueness
                onChanged: (newValue) {
                  //vehicleProvider.setSelectedDropdown7(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle variation';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.yearOfManufacture,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Manufacture Year
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Select Manufacture Year',
                value: vehicleProvider.selectedDropdown4,
                items: (vehicle?.manufactureYear ?? [])
                    .map((e) => e.text!)
                    .toList(),
                onChanged: (newValue) {
                  vehicleProvider.setSelectedDropdown4(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle manufacture year';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.fuelType,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            // Dropdown for Fuel Type
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: CustomDropdown(
                hintText: 'Select Fuel',
                value: vehicleProvider.selectedDropdown5,
                items: (vehicle?.fuelType ?? []).map((e) => e.text!).toSet().toList(),
                onChanged: (newValue) {
                  vehicleProvider.setSelectedDropdown5(newValue);
                },
                validator: (value) {
                  // Validate if a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a vehicle fuel';
                  }
                  return null;
                },
              ),
            ),

            const Text(
              Constants.capacity,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            // Dropdown for Vehicle Capacity
            CustomDropdown(
              hintText: 'Select Capacity',
              value: vehicleProvider.selectedDropdown3,
              items:
                  (vehicle?.vehicleCapacity ?? []).map((e) => e.text!).toList(),
              onChanged: (newValue) {
                vehicleProvider.setSelectedDropdown3(newValue);
              },
              validator: (value) {
                // Validate if a value is selected
                if (value == null || value.isEmpty) {
                  return 'Please select a vehicle capacity';
                }
                return null;
              },
            ),
          ],
        );
      } else {
        return const Center(child: Text('No data available'));
      }
    });
  }
}
