import 'package:blood_donor_app/controller/crud_controller.dart';
import 'package:blood_donor_app/model/donors_model.dart';
import 'package:blood_donor_app/view/add_screen/add_screen.dart';
import 'package:blood_donor_app/view/edit_screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<CrudController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text(
            'HomeScreen',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Consumer<CrudController>(builder: (context, homeProvider, child) {
          if (homeProvider.donorsDetails.isEmpty) {
            return const Center(
              child: Text(
                'No Data Avaliable',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: homeProvider.donorsDetails.length,
                  itemBuilder: (context, index) {
                    final DonorsModel data = homeProvider.donorsDetails[index];

                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.white,
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.red,
                              child: Text(
                                data.group.toString(),
                                style: const TextStyle(color: Colors.white),
                              )),
                          subtitle: Text(
                            data.number.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          title: Text(
                            data.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditScreen(
                                                name: data.name,
                                                number: data.number,
                                                group: data.group,
                                                id: data.id)));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 27,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    homeProvider.deleteDonor(data.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 27,
                                  )),
                            ],
                          ),
                        ));
                  }));
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              homeProvider.nameController.clear();
              homeProvider.numberController.clear();
              homeProvider.selectedGroups = '';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddUserScreen(),
                  ));
            }),
      ),
    );
  }
}
