import 'package:blood_donor_app/model/donors_model.dart';
import 'package:blood_donor_app/services/crud_services.dart';
import 'package:flutter/material.dart';

class AddUserController extends ChangeNotifier {
  final List bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroups;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<DonorsModel> donorsDetails = [];

  AddUserController() {
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
    print(donorsDetails);
    notifyListeners();
  }
}