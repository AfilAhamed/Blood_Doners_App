import 'package:blood_donor_app/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {
  final CollectionReference firebaseDatas =
      FirebaseFirestore.instance.collection('Donors Data');
  // Create
  void addDonors(donorName, donorNumber, donorGroup) {
    final data = DonorsModel(
            name: donorName, number: donorNumber, group: donorGroup, id: '')
        .toJson();
    firebaseDatas.add(data);
  }

  //Read
  Future<List<DonorsModel>> getDonors() async {
    final data = await firebaseDatas.orderBy('name').get();
    return data.docs
        .map((value) => DonorsModel.fromJson(
            value.data() as Map<String, dynamic>, value.id))
        .toList();
  }

  // update
  void updateDonors(donorName, donorNumber, donorGroup, id) {
    final data = DonorsModel(
            name: donorName, number: donorNumber, group: donorGroup, id: id)
        .toJson();
    firebaseDatas.doc(id).update(data);
  }

  //delete
  void deleteDonors(id) {
    firebaseDatas.doc(id).delete();
  }
}
