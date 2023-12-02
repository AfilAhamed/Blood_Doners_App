import 'package:blood_donor_app/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {
  final CollectionReference firebaseDatas =
      FirebaseFirestore.instance.collection('Donors Data');

  void addDonor(donorName, donorNumber, donorGroup) {
    final data =
        DonorsModel(name: donorName, number: donorNumber, group: donorGroup)
            .toJson();
    firebaseDatas.add(data);
  }
}
