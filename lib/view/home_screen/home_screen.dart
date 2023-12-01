import 'package:blood_donor_app/view/add_screen/add_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CollectionReference firebaseData =
      FirebaseFirestore.instance.collection('Donors Data');
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
              stream: firebaseData.orderBy('name').snapshots(),
              builder: (context, AsyncSnapshot snapshots) {
                return ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot data = snapshots.data!.docs[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.white,
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.redAccent,
                                child: Text(
                                  data['group'],
                                  style: const TextStyle(color: Colors.white),
                                )),
                            subtitle: Text(
                              data['number'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            title: Text(
                              data['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                      size: 27,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 27,
                                    )),
                              ],
                            ),
                          ));
                    });
              }),
        ),
      ),
    );
  }
}
