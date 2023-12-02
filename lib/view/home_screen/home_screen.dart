import 'package:blood_donor_app/controller/crud_controller.dart';
import 'package:blood_donor_app/model/donors_model.dart';
import 'package:blood_donor_app/view/add_screen/add_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CollectionReference firebaseData =
      FirebaseFirestore.instance.collection('Donors Data');

  void deletebyId(id) {
    firebaseData.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text(
            'HomeScreen',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Consumer<AddUserController>(builder: (context, provider, child) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: provider.donorsDetails.length,
                  itemBuilder: (context, index) {
                    final DonorsModel data = provider.donorsDetails[index];

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
                                    // Navigator.pushNamed(arguments: {
                                    //   'name': data['name'],
                                    //   'number': data['number'],
                                    //   'group': data['group'],
                                    //   'id': data.id
                                    // }, context, '/update');
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 27,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    //deletebyId();
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUserScreen(),
                  ));
            }),
      ),
    );
  }
}
