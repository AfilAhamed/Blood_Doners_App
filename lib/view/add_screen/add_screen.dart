import 'package:blood_donor_app/controller/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<CrudController>(context);

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
                controller: addProvider.nameController,
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
                controller: addProvider.numberController,
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
                  items: CrudController()
                      .bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    addProvider.selectedGroups = value as String?;
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
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    addProvider.addDonors();
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
