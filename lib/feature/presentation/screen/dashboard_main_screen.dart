import 'package:example/core/constants/constant_titles.dart';
import 'package:example/feature/presentation/screen/scanner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/custom/custom_dropdown.dart';
import '../../../core/custom/custom_textformfield.dart';
import '../controller/provider.dart';
import 'dropdown_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<VehicleProvider>(context, listen: false).vehicleUser();
  });
    // Provider.of<VehicleProvider>(context, listen: false).vehicleUser();
  }


  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                      const Text(
                        Constants.addVehicle,
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: ScannerScreen(),
                  ),

                  const Text(
                    Constants.tagName,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: CustomTextField(
                      controller:
                          Provider.of<VehicleProvider>(context, listen: false)
                              .nameController,
                      label: "name",
                      hint: "tag name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter tag name";
                        }
                        return null;
                      },
                    ),
                  ),

                  const Text(
                    Constants.registerNumber,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: CustomTextField(
                      controller:
                          Provider.of<VehicleProvider>(context, listen: false)
                              .registrationNoController,
                      label: "registration number",
                      hint: "Enter registration number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your registration number";
                        }
                        return null;
                      },
                    ),
                  ),

                  // Use FutureBuilder to fetch and display dropdown options
                  const DropdownScreen(),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Select an option:',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('temp'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: Provider.of<VehicleProvider>(context,
                                    listen: false)
                                .selectedValue,
                            activeColor: Colors
                                .pink, // Set pink color for the selected radio button
                            onChanged: (int? value) {
                              setState(() {
                                Provider.of<VehicleProvider>(context,
                                        listen: false)
                                    .setSelectedValue(value!);
                                // _selectedValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('perminent'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: Provider.of<VehicleProvider>(context,
                                    listen: false)
                                .selectedValue,
                            activeColor: Colors
                                .pink, // Set pink color for the selected radio button
                            onChanged: (int? value) {
                              setState(() {
                                Provider.of<VehicleProvider>(context,
                                        listen: false)
                                    .setSelectedValue(value!);
                                // _selectedValue = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Text(
                      Constants.other,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  CustomDropdown(
                    hintText: 'Other',
                    value: Provider.of<VehicleProvider>(context, listen: false)
                        .otherDropdown,
                    items: const ["option1", "option2", "option3"],
                    onChanged: (newValue) {
                      Provider.of<VehicleProvider>(context, listen: false)
                          .setOtherDropdown(newValue);
                    },
                  ),

                  const SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          print('Form is valid');
                          // Example: Show a confirmation message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Form submitted successfully!')),
                          );
                        } else {
                          // If form is not valid, show validation errors
                          print('Form is not valid');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please fill out all fields correctly.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.red[400]),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 132, right: 132, top: 10, bottom: 10),
                        child: Text(
                          Constants.add,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
