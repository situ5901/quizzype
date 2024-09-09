import 'dart:convert';

class StudentDetails {
  var selectEducation;
  var fullname;
  var address;
  var phoneNumber;
  var schoolName;
  var schoolAddress;
  var boardOption;
  var classValue;
  var mediumName;
  var aadharcard;

  StudentDetails({
    required this.selectEducation,
    required this.fullname,
    required this.address,
    required this.phoneNumber,
    required this.schoolName,
    required this.schoolAddress,
    required this.boardOption,
    required this.classValue,
    required this.mediumName,
    required this.aadharcard,
  });

  Map<String, dynamic> toJson() => {
    'selectEducation': selectEducation,
    'fullname': fullname,
    'address': address,
    'phoneNumber': phoneNumber,
    'schoolName': schoolName,
    'schoolAddress': schoolAddress,
    'boardOption': boardOption,
    'classValue': classValue,
    'mediumName': mediumName,
     'aadharcard': aadharcard,
  };

  // Create a StudentDetails object from a JSON map
  factory StudentDetails.fromJson(Map<String, dynamic> json) {
    return StudentDetails(
      selectEducation: json['selectEducation'],
      fullname: json['fullname'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      schoolName: json['schoolName'],
      schoolAddress: json['schoolAddress'],
      boardOption: json['boardOption'],
      classValue: json['classvalue'],
      mediumName: json['mediumName'],
      aadharcard: json['aadharcard'],
    );
  }


  String toRawJson() => json.encode(toJson());
  factory StudentDetails.fromRawJson(String str) =>
      StudentDetails.fromJson(json.decode(str));
}
