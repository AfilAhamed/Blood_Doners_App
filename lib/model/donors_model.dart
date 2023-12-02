class DonorsModel {
  String? name;
  String? number;
  String? group;

  DonorsModel({required this.name, required this.number, required this.group});

  factory DonorsModel.fromJson(Map data) {
    return DonorsModel(
        name: data['name'], number: data['number'], group: data['group']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'number': number, 'group': group};
  }
}
