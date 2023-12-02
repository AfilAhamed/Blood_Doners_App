import 'package:blood_donor_app/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {
  final CollectionReference firebaseDatas =
      FirebaseFirestore.instance.collection('Donors Data');
  // Create
  void addDonors(donorName, donorNumber, donorGroup) {
    final data =
        DonorsModel(name: donorName, number: donorNumber, group: donorGroup)
            .toJson();
    firebaseDatas.add(data);
  }

  //Read
  Future<List<DonorsModel>> getDonors() async {
    final data = await firebaseDatas.orderBy('name').get();
    return data.docs
        .map((value) =>
            DonorsModel.fromJson(value.data() as Map<String, dynamic>))
        .toList();
  }
}
