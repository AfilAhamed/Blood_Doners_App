import 'package:blood_donor_app/model/donors_model.dart';
import 'package:blood_donor_app/services/crud_services.dart';
import 'package:flutter/material.dart';

class CrudController extends ChangeNotifier {
  final List bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroups;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<DonorsModel> donorsDetails = [];

  CrudController() {
    getDonors();
  }
  //add Donor details
  void addDonors() {
    CrudServices()
        .addDonors(nameController.text, numberController.text, selectedGroups);
    getDonors();

    notifyListeners();
  }

  //get donor details
  void getDonors() async {
    donorsDetails = await CrudServices().getDonors();
    notifyListeners();
  }

  //update donor details
  void updateDonors(id) {
    CrudServices().updateDonors(
        nameController.text, numberController.text, selectedGroups, id);
    getDonors();
    notifyListeners();
  }
  // delete donor details

  void deleteDonor(id) {
    CrudServices().deleteDonors(id);
    getDonors();
    notifyListeners();
  }
}
