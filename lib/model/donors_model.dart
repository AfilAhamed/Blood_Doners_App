class DonorsModel {
  String? id;
  String? name;
  String? number;
  String? group;

  DonorsModel(
      {required this.name,
      required this.number,
      required this.group,
      required this.id});

  factory DonorsModel.fromJson(Map data, id) {
    return DonorsModel(
        name: data['name'],
        number: data['number'],
        group: data['group'],
        id: id);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'number': number, 'group': group};
  }
}
