import 'package:blood_donor_app/controller/add_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});
  final CollectionReference firebaseData =
      FirebaseFirestore.instance.collection('Donors Data');
  @override
  Widget build(BuildContext context) {
    String? selectedGroups;

    final TextEditingController nameController = TextEditingController();
    final TextEditingController numberController = TextEditingController();

    void addDonor() {
      final donor = {
        'name': nameController.text,
        'number': numberController.text,
        'group': selectedGroups
      };
      firebaseData.add(donor);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AddScreen', style: TextStyle(fontSize: 22)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  )),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              TextFormField(
                controller: numberController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Number',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  hint: const Text('Blood Group'),
                  items: AddUserController()
                      .bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    selectedGroups = value as String?;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size(double.infinity, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent)),
                  onPressed: () {
                    addDonor();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
