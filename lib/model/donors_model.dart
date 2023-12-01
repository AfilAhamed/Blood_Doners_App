class DonorsModel {
  String? name;
  int? number;
  String? group;

  DonorsModel({required this.name, required this.number, required this.group});

  factory DonorsModel.fromData(Map data) {
    return DonorsModel(
        name: data['name'], number: data['number'], group: data['group']);
  }
}
