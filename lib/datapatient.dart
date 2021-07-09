class IdData {
  int id;
  String name;
  int age;
  int weight;
  String address;
  String bloodGroup;
  String underlyingDisease;
  String allergic;

  IdData({
    required this.id,
    required this.name,
    required this.age,
    required this.weight,
    required this.address,
    required this.bloodGroup,
    required this.underlyingDisease,
    required this.allergic,
  });

  factory IdData.fromJson(Map<String, dynamic> json) {
    return IdData(
      id: json['_id'],
      name: json['name'],
      age: json["age"],
      weight: json['weight'],
      address: json['address'],
      bloodGroup: json['bloodGroup'],
      underlyingDisease: json['underlyingDisease'],
      allergic: json['allergic'],
    );
  }
}
