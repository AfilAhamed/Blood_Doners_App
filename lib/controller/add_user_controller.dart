import 'package:blood_donor_app/services/crud_services.dart';
import 'package:flutter/material.dart';

class AddUserController extends ChangeNotifier {
  final List bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  String? selectedGroups;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  //add Donor details
  void addDonors() {
    CrudServices()
        .addDonor(nameController.text, numberController.text, selectedGroups);
    notifyListeners();
  }
}
