class Userdata {
  String id;
  String date;
  int idPatient;
  String idDoctor;
  String namePatient;
  String nameDoctor;
  String symptom;
  String nextDate;
  //  data;
  // String qrCode;

  Userdata({
    required this.id,
    required this.date,
    required this.idPatient,
    required this.idDoctor,
    required this.namePatient,
    required this.nameDoctor,
    required this.symptom,
    required this.nextDate,
    // required this.data
    // required this.qrCode,
  });

  factory Userdata.fromJson(
    Map<String, dynamic> json,
  ) {
    return Userdata(
      id: json['_id'],
      date: json['date'],
      idPatient: json['idPatient'],
      idDoctor: json['idDoctor'],
      namePatient: json['namePatient'],
      nameDoctor: json['nameDoctor'],
      symptom: json['symptom'],
      nextDate: json['nextDate'],
      // data: json['data'],
    );
  }
}
