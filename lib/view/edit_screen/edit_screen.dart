import 'package:blood_donor_app/controller/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen(
      {super.key,
      required this.name,
      required this.number,
      required this.group,
      required this.id});
  final String? name;
  final String? number;
  final String? group;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final editProvider = Provider.of<CrudController>(context);
    editProvider.nameController.text = name!;
    editProvider.numberController.text = number!;
    editProvider.selectedGroups = group;
    final docsId = id;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EditScreen', style: TextStyle(fontSize: 22)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: editProvider.nameController,
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
                controller: editProvider.numberController,
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
                  value: editProvider.selectedGroups,
                  hint: const Text('Blood Group'),
                  items: CrudController()
                      .bloodGroups
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    editProvider.selectedGroups = value as String?;
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
                    editProvider.updateDonors(docsId);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Edit',
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
