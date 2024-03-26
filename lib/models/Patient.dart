class Patient {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String number;
  final String gender;
  final String dob;

  Patient(
      {this.id,
      required this.fullName,
      required this.email,
      required this.address,
      required this.number,
      required this.gender,
      required this.dob});

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullName,
      'email': email,
      'address': address,
      'number': number,
      'gender': gender,
      'dob': dob
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'] as String,
      fullName: json['fullname'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      number: json['phone'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
    );
  }
}
